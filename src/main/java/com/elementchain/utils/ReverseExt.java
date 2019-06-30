package com.elementchain.utils;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.net.URL;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * MyBaits工具类，用于扩展逆向工程
 *
 * @author 文龙
 */
public class ReverseExt {
    private static Pattern pattern = Pattern.compile("_[a-z]");

    private static Matcher matcher;

    private static SAXReader saxreader;

    private static Document document;

    private static final String CREATE_TIME = "`gmt_create`";

    private static final String UPDATE_TIME = "`gmt_modified`";

    private static Map<String, String> typeMap = new HashMap<>();

    static {
        typeMap.put("VARCHAR", "String");
        typeMap.put("CHAR", "String");
        typeMap.put("INTEGER", "Integer");
        typeMap.put("BIGINT", "Long");
        typeMap.put("TIMESTAMP", "Date");
        typeMap.put("DATE", "Date");
        typeMap.put("DECIMAL", "Double");
        typeMap.put("BIT", "Boolean");
    }

    /**
     * 数据表转java类
     *
     * @param table 表名
     * @return 类名
     */
    private static String tableToClass(String table) {
        table = table.toLowerCase();
        matcher = pattern.matcher(table);
        while (matcher.find()) {
            table = table.replace(matcher.group(), matcher.group().substring(1).toUpperCase());
        }
        return table.toUpperCase().substring(0, 1) + table.substring(1, table.length());
    }

    /**
     * 逆向工程增强
     *
     * @param table 表名
     * @param mapperPath    mapper路径
     * @param classFullName 全类名
     */
    private static List<String[]> inverseExt(String table, String mapperPath, String classFullName) {
        try {
            saxreader = new SAXReader();
            document = saxreader.read(mapperPath);
            Element rootElement = document.getRootElement();
            Element baseMap = document.getRootElement().element("resultMap");
            rootElement.remove(baseMap);
            List<Element> columnList = baseMap.elements("result");
            Element idElement = baseMap.element("id");
            if (Objects.isNull(idElement)) {
                idElement = (Element) baseMap.selectSingleNode("result[@property='id']");
            }
            String idField = idElement.attributeValue("property");
            baseMap.remove(idElement);
            baseMap.setText("\n        ");
            baseMap.add(idElement);
            String idColumn = "`" + idElement.attributeValue("column") + "`";
            String idType = idElement.attributeValue("jdbcType");
            String[] fields = new String[columnList.size()];
            String[] columns = new String[columnList.size()];
            String[] jdbcTypes = new String[columnList.size()];
            List<String[]> list = new ArrayList<>();
            String[] strs = new String[2];
            strs[0] = idField;
            strs[1] = idType;
            list.add(strs);
            for (int i = 0; i < fields.length; i++) {
                Element column = columnList.get(i);
                baseMap.remove(column);
                baseMap.addText("\n        ");
                baseMap.add(column);
                fields[i] = column.attributeValue("property");
                columns[i] = "`" + column.attributeValue("column") + "`";
                jdbcTypes[i] = column.attributeValue("jdbcType");
                list.add(new String[]{fields[i], jdbcTypes[i]});
            }
            baseMap.addText("\n    ");
            //取出所有节点并移除
            Element insertElement = (Element) rootElement.selectSingleNode("insert[@id='insert']");
            insertElement.setText("\n        insert into " + table + " values(#{" + idField + ",jdbcType=" + idType + "}, ");
            insertElement.addText("\n        ");
            for (int i = 0; i < columns.length; i++) {
                if (i < columns.length - 1) {
                    if (columns[i].equals(CREATE_TIME) || columns[i].equals(UPDATE_TIME)) {
                        insertElement.addText("now(), ");
                    } else {
                        insertElement.addText("#{" + fields[i] + ", jdbcType=" + jdbcTypes[i] + "}, ");
                    }
                    insertElement.addText("\n        ");
                } else {
                    if (columns[i].equals(CREATE_TIME) || columns[i].equals(UPDATE_TIME)) {
                        insertElement.addText("now()");
                    } else {
                        insertElement.addText("#{" + fields[i] + ",jdbcType=" + jdbcTypes[i] + "}");
                    }
                }
            }
            insertElement.addText(")\n    ");

            Element updateByPrimaryKeyElement = (Element) rootElement.selectSingleNode("update[@id='updateByPrimaryKey']");
            updateByPrimaryKeyElement.setText("\n        update " + table + "\n        ");
            Element setElement = DocumentHelper.createElement("set");
            setElement.addText("\n");
            for (int i = 0; i < columns.length; i++) {
                if (i < columns.length - 1) {
                    if (!columns[i].equals(CREATE_TIME)) {
                        setElement.addText("            ");
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.setText(setElement.getText() + " " + columns[i] +
                                    " = now(),\n");
                        } else {
                            setElement.setText(setElement.getText() + " " + columns[i] +
                                    " = #{" + fields[i] + ", jdbcType=" + jdbcTypes[i] + "},\n");
                        }
                    }
                } else {
                    if (!columns[i].equals(CREATE_TIME)) {
                        setElement.addText("            ");
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.setText(setElement.getText() + " " + columns[i] +
                                    " = now()");
                        } else {
                            setElement.setText(setElement.getText() + " " + columns[i] +
                                    " = #{" + fields[i] + ", jdbcType=" + jdbcTypes[i] + "}");
                        }
                    }
                    setElement.addText("            ");
                }
            }
            setElement.addText("\n        ");
            updateByPrimaryKeyElement.add(setElement);
            updateByPrimaryKeyElement.addText("\n        where " + idColumn + " = #{" + idField + ", jdbcType=" + idType + "}\n    ");

            Element deleteByPrimaryKeyElement = (Element) rootElement.selectSingleNode("delete[@id='deleteByPrimaryKey']");
            deleteByPrimaryKeyElement.setText("\n        delete from " + table + " where " + idColumn + " = #{" + idField + ", jdbcType=" + idType + "}\n    ");

            Element selectByPrimaryKeyElement = (Element) rootElement.selectSingleNode("select[@id='selectByPrimaryKey']");
            selectByPrimaryKeyElement.setText("\n        select ");
            Element includeElement = DocumentHelper.createElement("include");
            includeElement.addAttribute("refid", "BaseColumns");
            selectByPrimaryKeyElement.add(includeElement);
            selectByPrimaryKeyElement.addText("from " + table + " where " + idColumn + " = #{" + idField + ", jdbcType=" + idType + "}\n    ");

            Element selectAllElement = (Element) rootElement.selectSingleNode("select[@id='selectAll']");
            selectAllElement.setText("\n        select ");
            includeElement = DocumentHelper.createElement("include");
            includeElement.addAttribute("refid", "BaseColumns");
            selectAllElement.add(includeElement);
            selectAllElement.addText("from " + table + "\n    ");
            //取消一级缓存
            selectAllElement.addAttribute("flushCache", "true");

            rootElement.remove(insertElement);
            rootElement.remove(updateByPrimaryKeyElement);
            rootElement.remove(deleteByPrimaryKeyElement);
            rootElement.remove(selectByPrimaryKeyElement);
            rootElement.remove(selectAllElement);

            //生成BaseColumns
            Element baseColumns = DocumentHelper.createElement("sql");
            baseColumns.addAttribute("id", "BaseColumns");
            baseColumns.setText("\n        " + idColumn + ", " + arraysToString(columns, ", ") + "\n    ");

            //生成选择性添加节点
            Element insertSelectiveElement = DocumentHelper.createElement("insert");
            insertSelectiveElement.setText("\n        insert into " + table + "\n        ");
            insertSelectiveElement.addAttribute("id", "insertSelective");
            insertSelectiveElement.addAttribute("parameterType", classFullName);
            Element trimElement = DocumentHelper.createElement("trim");
            trimElement.addAttribute("prefix", "(");
            trimElement.addAttribute("suffix", ")");
            trimElement.addAttribute("suffixOverrides", ",");
            insertSelectiveElement.add(trimElement);
            Element idIfElement = DocumentHelper.createElement("if");
            idIfElement.addAttribute("test", idField + " != null");
            idIfElement.setText(idColumn + ",");
            trimElement.addText("\n            ");
            trimElement.add(idIfElement);
            trimElement.addText("\n            ");
            for (int i = 0; i < columns.length; i++) {
                if (i < columns.length - 1) {
                    if (columns[i].equals(CREATE_TIME) || columns[i].equals(UPDATE_TIME)) {
                        trimElement.addText(columns[i] + ",");
                    } else {
                        Element ifElement = DocumentHelper.createElement("if");
                        ifElement.addAttribute("test", fields[i] + " != null");
                        ifElement.setText(columns[i] + ",");
                        trimElement.add(ifElement);
                    }
                    trimElement.addText("\n            ");
                } else {
                    if (columns[i].equals(CREATE_TIME) || columns[i].equals(UPDATE_TIME)) {
                        trimElement.addText(columns[i]);
                    } else {
                        Element ifElement = DocumentHelper.createElement("if");
                        ifElement.addAttribute("test", fields[i] + " != null");
                        ifElement.setText(columns[i]);
                        trimElement.add(ifElement);
                    }
                    trimElement.addText("\n        ");
                }
            }
            insertSelectiveElement.addText("\n        ");
            trimElement = DocumentHelper.createElement("trim");
            trimElement.addAttribute("prefix", "values (");
            trimElement.addAttribute("suffix", ")");
            trimElement.addAttribute("suffixOverrides", ",");
            insertSelectiveElement.add(trimElement);
            idIfElement = DocumentHelper.createElement("if");
            idIfElement.addAttribute("test", idField + " != null");
            idIfElement.setText("#{" + idField + ", jdbcType=" + idType + "},");
            trimElement.addText("\n            ");
            trimElement.add(idIfElement);
            trimElement.addText("\n            ");
            for (int i = 0; i < columns.length; i++) {
                if (i < columns.length - 1) {
                    if (columns[i].equals(CREATE_TIME) || columns[i].equals(UPDATE_TIME)) {
                        trimElement.addText("now(),");
                    } else {
                        Element ifElement = DocumentHelper.createElement("if");
                        ifElement.addAttribute("test", fields[i] + " != null");
                        ifElement.setText("#{" + fields[i] + ", jdbcType=" + jdbcTypes[i] + "},");
                        trimElement.add(ifElement);
                    }
                    trimElement.addText("\n            ");
                } else {
                    if (columns[i].equals(CREATE_TIME) || columns[i].equals(UPDATE_TIME)) {
                        trimElement.addText("now()");
                    } else {
                        Element ifElement = DocumentHelper.createElement("if");
                        ifElement.addAttribute("test", fields[i] + " != null");
                        ifElement.setText("#{" + fields[i] + ", jdbcType=" + jdbcTypes[i] + "}");
                        trimElement.add(ifElement);
                    }
                    trimElement.addText("\n        ");
                }
            }
            insertSelectiveElement.addText("\n    ");

            //生成依赖主键选择性更新节点
            Element updateByPrimaryKeySelectiveElement = DocumentHelper.createElement("update");
            updateByPrimaryKeySelectiveElement.addAttribute("id", "updateByPrimaryKeySelective");
            updateByPrimaryKeySelectiveElement.addAttribute("parameterType", classFullName);
            updateByPrimaryKeySelectiveElement.setText("\n       update " + table + "\n        ");
            setElement = DocumentHelper.createElement("set");
            setElement.addText("\n            ");
            for (int i = 0; i < fields.length; i++) {
                if (i < columns.length - 1) {
                    if (!columns[i].equals(CREATE_TIME)) {
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.addText(columns[i] + " = now(),");
                        } else {
                            Element ifElement = DocumentHelper.createElement("if");
                            ifElement.addAttribute("test", fields[i] + " != null");
                            ifElement.setText(columns[i] + " = #{" + fields[i] + ", jdbcType=" + jdbcTypes[i] + "},");
                            setElement.add(ifElement);
                        }
                        setElement.addText("\n            ");
                    }
                } else {
                    if (!columns[i].equals(CREATE_TIME)) {
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.addText(columns[i] + " = now()");
                        } else {
                            Element ifElement = DocumentHelper.createElement("if");
                            ifElement.addAttribute("test", fields[i] + " != null");
                            ifElement.setText(columns[i] + " = #{" + fields[i] + ", jdbcType=" + jdbcTypes[i] + "}");
                            setElement.add(ifElement);
                        }
                        setElement.addText("\n        ");
                    }
                }
            }
            updateByPrimaryKeySelectiveElement.add(setElement);
            updateByPrimaryKeySelectiveElement.addText("\n        where " + idColumn + " = #{" + idField + ", jdbcType=" + idType + "}\n    ");

            //生成依赖标准更新的节点
            Element updateByCriteriaElement = DocumentHelper.createElement("update");
            updateByCriteriaElement.addAttribute("id", "updateByCriteria");
            updateByCriteriaElement.setText("\n        update " + table + "\n        ");
            setElement = DocumentHelper.createElement("set");
            setElement.setText("\n");
            updateByCriteriaElement.add(setElement);
            for (int i = 0; i < fields.length; i++) {
                if (i < columns.length - 1) {
                    if (!columns[i].equals(CREATE_TIME)) {
                        setElement.addText("            ");
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.addText(columns[i] +
                                    " = now(),\n");
                        } else {
                            setElement.addText(columns[i] +
                                    " = #{t." + fields[i] + ", jdbcType=" + jdbcTypes[i] + "},\n");
                        }
                    }
                } else {
                    if (!columns[i].equals(CREATE_TIME)) {
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.addText("            ");
                            setElement.addText(columns[i] +
                                    " = now()\n");
                        } else {
                            setElement.addText(columns[i] +
                                    " = #{t." + fields[i] + ", jdbcType=" + jdbcTypes[i] + "}\n");
                        }
                        setElement.addText("        ");
                    }
                }
            }
            updateByCriteriaElement.addText("\n    ");

            //生成依赖标准选择性更新的节点
            Element updateByCriteriaSelectiveElement = DocumentHelper.createElement("update");
            updateByCriteriaSelectiveElement.addAttribute("id", "updateByCriteriaSelective");
            updateByCriteriaSelectiveElement.setText("\n        update " + table + "\n        ");
            setElement = DocumentHelper.createElement("set");
            setElement.setText("\n            ");
            for (int i = 0; i < fields.length; i++) {
                if (i < columns.length - 1) {
                    if (!columns[i].equals(CREATE_TIME)) {
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.addText(columns[i] + " = now(),");
                        } else {
                            Element ifElement = DocumentHelper.createElement("if");
                            ifElement.addAttribute("test", "t." + fields[i] + " != null");
                            ifElement.setText(columns[i] + " = #{t." + fields[i] + ", jdbcType=" + jdbcTypes[i] + "},");
                            setElement.add(ifElement);
                        }
                        setElement.addText("\n            ");
                    }
                } else {
                    if (!columns[i].equals(CREATE_TIME)) {
                        if (columns[i].equals(UPDATE_TIME)) {
                            setElement.addText(columns[i] + " = now()");
                        } else {
                            Element ifElement = DocumentHelper.createElement("if");
                            ifElement.addAttribute("test", "t." + fields[i] + " != null");
                            ifElement.setText(columns[i] + " = #{t." + fields[i] + ", jdbcType=" + jdbcTypes[i] + "}");
                            setElement.add(ifElement);
                        }
                    }
                    setElement.addText("\n        ");
                }
            }
            updateByCriteriaSelectiveElement.add(setElement);
            updateByCriteriaSelectiveElement.addText("\n    ");

            //生成依赖标准删除的节点
            Element deleteByCriteriaElement = DocumentHelper.createElement("delete");
            deleteByCriteriaElement.addAttribute("id", "deleteByCriteria");
            deleteByCriteriaElement.setText("\n        delete from " + table + "\n    ");

            //生成batchDelete节点
            Element batchDeleteElement = DocumentHelper.createElement("delete");
            batchDeleteElement.addAttribute("id", "batchDelete");
            batchDeleteElement.setText("\n        delete from " + table + " where " + idColumn + " in\n        ");
            Element foreachElement = DocumentHelper.createElement("foreach");
            foreachElement.addAttribute("collection", "array");
            foreachElement.addAttribute("item", "entity");
            foreachElement.addAttribute("open", "(");
            foreachElement.addAttribute("close", ")");
            foreachElement.addAttribute("separator", ",");
            foreachElement.setText("\n            #{entity." + idField + "}\n        ");
            batchDeleteElement.add(foreachElement);
            batchDeleteElement.addText("\n    ");

            //生成countByCriteria节点
            Element countByCriteriaElement = DocumentHelper.createElement("select");
            countByCriteriaElement.addAttribute("id", "countByCriteria");
            countByCriteriaElement.addAttribute("resultType", "java.lang.Integer");
            countByCriteriaElement.setText("\n        select count(*) from " + table + "\n    ");

            //生成单列投影查询
            Element selectSingleShadowElement = DocumentHelper.createElement("select");
            selectSingleShadowElement.addAttribute("id", "selectSingleShadow");
            selectSingleShadowElement.addAttribute("resultType", "object");
            selectSingleShadowElement.setText("\n        select ${columns} from "+table+" \n    ");

            //生成多列投影查询
            Element selectMutipleShadowElement = DocumentHelper.createElement("select");
            selectMutipleShadowElement.addAttribute("id", "selectMutipleShadow");
            selectMutipleShadowElement.addAttribute("resultType", "map");
            selectMutipleShadowElement.setText("\n        select ${columns} from "+table+"\n    ");

            //按照指定的顺序依次添加节点
            rootElement.addText("\n    ");
            rootElement.add(baseMap);
            rootElement.addText("\n    ");
            rootElement.add(baseColumns);
            rootElement.addText("\n    ");
            rootElement.add(insertElement);
            rootElement.addText("\n    ");
            rootElement.add(insertSelectiveElement);
            rootElement.addText("\n    ");
            rootElement.add(updateByPrimaryKeyElement);
            rootElement.addText("\n    ");
            rootElement.add(updateByPrimaryKeySelectiveElement);
            rootElement.addText("\n    ");
            rootElement.add(updateByCriteriaElement);
            rootElement.addText("\n    ");
            rootElement.add(updateByCriteriaSelectiveElement);
            rootElement.addText("\n    ");
            rootElement.add(deleteByPrimaryKeyElement);
            rootElement.addText("\n    ");
            rootElement.add(deleteByCriteriaElement);
            rootElement.addText("\n    ");
            rootElement.add(batchDeleteElement);
            rootElement.addText("\n    ");
            rootElement.add(selectByPrimaryKeyElement);
            rootElement.addText("\n    ");
            rootElement.add(selectAllElement);
            rootElement.addText("\n    ");
            rootElement.add(countByCriteriaElement);
            rootElement.addText("\n    ");
            rootElement.add(selectSingleShadowElement);
            rootElement.addText("\n    ");
            rootElement.add(selectMutipleShadowElement);
            rootElement.addText("\n");
            //设置输出格式
            OutputFormat format= OutputFormat.createPrettyPrint();
            format.setEncoding("UTF-8");
            XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(mapperPath));
            xmlWriter.write(document);
            xmlWriter.close();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void generate(String groupId) {
        generate("generatorConfig.xml", groupId);
    }

    public static void generate(String configPath, String groupId) {
        //逆向工程
        List<String> warnings = new ArrayList<>();
        boolean overwrite = true;
        URL url = ReverseExt.class.getClassLoader().getResource(configPath);
        File configFile = new File(url.getFile());
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config;
        try {
            config = cp.parseConfiguration(configFile);
            DefaultShellCallback callback = new DefaultShellCallback(overwrite);
            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
            myBatisGenerator.generate(null);
//            //逆向工程增强
            generateExt(configPath, groupId);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }

    }

    public static void generateExt(String groupId) throws DocumentException {
        generateExt("generatorConfig.xml", groupId);
    }

    public static void generateExt(String configPath, String groupId) throws DocumentException {
        //逆向工程增强
        URL url = ReverseExt.class.getClassLoader().getResource(configPath);
        File configFile = new File(url.getFile());
        saxreader = new SAXReader();
        document = saxreader.read(configFile);
        Element contextElement = document.getRootElement().element("context");
        boolean forceBigDecimals = false;
        Element javaTypeResolverElement = contextElement.element("javaTypeResolver");
        if(javaTypeResolverElement != null) {
            Element forceBigDecimalsElement = (Element) javaTypeResolverElement.selectSingleNode("property[@name='forceBigDecimals']");
            if(forceBigDecimalsElement != null) {
                forceBigDecimals = Boolean.valueOf(forceBigDecimalsElement.attributeValue("value"));
                if(forceBigDecimals) {
                    typeMap.put("DECIMAL", "BigDecimal");
                }
            }
        }
        String entityPath = contextElement.element("javaModelGenerator").attributeValue("targetPackage");
        String targetPackage = contextElement.element("sqlMapGenerator").attributeValue("targetPackage");
        String mapperPath = "src/main/java/" + targetPackage.replace(".", "/");
        List<Element> tableElementList = contextElement.elements("table");
        for (Element tableElement : tableElementList) {
            String table = tableElement.attributeValue("tableName");
            String entityName = tableElement.attributeValue("domainObjectName");
            if (StringUtils.isEmpty(entityName)) {
                entityName = tableToClass(table);
            }
            System.out.println("逆向工程增强");
            List<String[]> list = inverseExt(table, mapperPath + "/" + entityName + "Mapper.xml", entityPath + "." + entityName);
            System.out.println("开始生成java代码");
            boolean hasDate = false;
            boolean hasBigDecimal = false;
            for (String[] strs : list) {
                if (strs[1].equals("TIMESTAMP") || strs[1].equals("DATE")) {
                    hasDate = true;
                }else if(strs[1].equals("DECIMAL") && forceBigDecimals) {
                    hasBigDecimal = true;
                }
            }
            // 生成entity
            StringBuilder entityBuilder = new StringBuilder("package ").append(entityPath)
                    .append(";\n\nimport lombok.Data;\n\n")
                    .append("import java.io.Serializable;\n");
            if(hasBigDecimal) {
                entityBuilder.append("import java.math.BigDecimal;\n");
            }
            if(hasDate) {
                entityBuilder.append("import java.util.Date;\n\n");
            }
            entityBuilder.append("@Data\npublic class ").append(entityName)
                    .append(" implements Serializable {\n\n")
                    .append("    private static final long serialVersionUID = 1L;\n\n");
            for (String[] strs : list) {
                entityBuilder.append("    private ").append(typeMap.get(strs[1])).append(" ").append(strs[0]).append(";\n\n");
            }
            entityBuilder.append("}");
            try (FileWriter writer = new FileWriter(new File("src/main/java/" + entityPath.replace(".", "/") + "/" + entityName + ".java"))) {
                writer.write(entityBuilder.toString());
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }

            // 生成Mapper
            StringBuilder str = new StringBuilder("package ")
                    .append(targetPackage).append(";\n\nimport ").append(groupId).append(".base.mapper.BaseMapper;\n")
                    .append("import ").append(entityPath).append(".").append(entityName).append(";\n\n").append("public interface ")
                    .append(entityName).append("Mapper").append(" extends BaseMapper<").append(entityName).append("> {\n\n}");
            try (FileWriter writer = new FileWriter(new File(mapperPath + "/" + entityName + "Mapper.java"))) {
                writer.write(str.toString());
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
            //生成service
            File file = new File(mapperPath.replace("mapper", "service") + "/" + entityName + "Service.java");
            //如果Service不存在则创建Service和实现类
            if (!file.exists()) {
                str = new StringBuilder("package ");
                str.append(targetPackage.replace("mapper", "service")).append(";\n\nimport ").append(groupId)
                        .append(".base.service.BaseService;\n").append("import ").append(entityPath).append(".").append(entityName)
                        .append(";\n\n").append("public interface ").append(entityName).append("Service extends BaseService<")
                        .append(entityName).append("> {\n\n}");
                //生成父文件夹
                if (!file.getParentFile().exists()) {
                    file.getParentFile().mkdir();
                }
                try (FileWriter writer = new FileWriter(file)) {
                    writer.write(str.toString());
                } catch (Exception e) {
                    throw new RuntimeException(e.getMessage());
                }

                //生成service实现类
                str = new StringBuilder("package ");
                str.append(targetPackage.replace("mapper", "service.impl"))
                        .append(";\n\nimport org.springframework.stereotype.Service;\n\nimport ").append(groupId)
                        .append(".base.service.BaseServiceImpl;\nimport ").append(entityPath).append(".").append(entityName)
                        .append(";\nimport ").append(targetPackage).append(".").append(entityName).append("Mapper;\nimport ")
                        .append(targetPackage.replace("mapper", "service.")).append(entityName).append("Service;\n\n@Service\n")
                        .append("public class ").append(entityName).append("ServiceImpl extends BaseServiceImpl<").append(entityName)
                        .append(", ").append(entityName).append("Mapper")
                        .append("> implements ").append(entityName).append("Service {\n\n}");
                file = new File(mapperPath.replace("mapper", "service/impl"));
                if (file.mkdir()) {

                }
                try (FileWriter writer = new FileWriter(new File(mapperPath.replace("mapper", "service/impl") + "/" + entityName + "ServiceImpl.java"));) {
                    writer.write(str.toString());
                } catch (Exception e) {
                    throw new RuntimeException(e.getMessage());
                }
            }
        }
        System.out.println("结束");
    }

    /**
     * 数组转字符串
     *
     * @param objs     被转换的数组
     * @param separate 间隔符号
     * @return 目标字符串
     */
    private static String arraysToString(Object[] objs, String separate) {
        StringBuilder builder = new StringBuilder();
        if (!StringUtils.isEmpty(objs)) {
            for (Object obj : objs) {
                builder.append(obj.toString()).append(separate);
            }
        }
        return builder.length() > 0 ? builder.substring(0, builder.length() - separate.length()) : "";
    }

}
