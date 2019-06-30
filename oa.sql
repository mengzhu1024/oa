/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-06-05 23:18:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_right`
-- ----------------------------
DROP TABLE IF EXISTS `auth_right`;
CREATE TABLE `auth_right` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `url` varchar(80) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `common` bit(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_right
-- ----------------------------
INSERT INTO `auth_right` VALUES ('063bda04-a333-47df-95f8-e12372656f75', '操作表单', '/toOperateForm.action', '这是操作表单的权限', '16384', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('08d6bd81-fc8d-42c9-84e9-330603e9fae6', '查看权限', '/toRightAdmin.action', '这是查看权限的权限', '1', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('0968176d-af92-4580-8e3a-82f8bcd12ac6', '批量更新角色', '/toBatchUpdateRole.action', '这是批量更新角色的权限', '32', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('128c7c0d-c5ba-48fe-b095-833c391a4187', '删除表单', '/toDeleteForm.action', '这是删除表单', '65536', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('19b67730-7662-4c78-8e15-93a65c13ca02', '批量添加角色', '/toBatchAddRole.action', '这是批量添加角色的权限', '8', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('19e8e913-b4e5-43c4-85c4-cc8da3ff8592', '去往主页面', '/toMainView.action', '这是去往主页面的权限', '33554432', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('2473af68-9768-4532-b4ef-4a20b849b45d', '批量更新职位', '/toBatchUpdatePosition.action', '这是批量更新职位的权限', '8', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('278cf6a1-dfa9-461a-b9bb-d18598c34949', '删除流程实例', '/toDeleteAffair.action', '这是删除流程实例', '64', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('296cb332-905b-4cb4-a165-ea2b9fb9e415', '批量更新流程', '/toBatchUpdateProcedure.action', '这是批量更新流程的权限', '1024', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('2afc3d55-cd5f-47ac-bc03-6f5a3a0bf485', '查看角色', '/toRoleAdmin.action', '这是查看角色的权限', '16', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('308014ea-ec49-47d0-bec0-b32d1076db81', '删除职位', '/toDeletePosition.action', '这是删除职位的权限，包括批量删除', '2', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('31f63d02-9896-4d0c-8b7b-aa2d26e4a0c1', '查看分组', '/toGroupAdmin.action', '这是查看分组的权限', '262144', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('3360170d-864a-494f-b65b-1dd159d377f6', '删除流程', '/toDeleteProcedure.action', '这是删除流程的权限，包括批量删除', '2048', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('33e91148-b656-41f0-8c11-1a68dbae73b2', '查看流程实例', '/toAffairAdmin.action', '这是查看流程实例的权限', '16', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('41aa1737-205c-49a2-9acf-adb792e564dc', '上传文件', '/toFileUpload.action', '这是上传文件的权限，公共权限', '512', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('41e80c1b-3e7b-4b9c-9464-189b87e7a807', '查看员工', '/toEmployeeAdmin.action', '这是查看员工的权限', '67108864', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('444096e7-3bf8-41ba-8bba-8843877122f3', '操作分组', '/toOperateGroup.action', '这是操作分组的权限，用来关联成员和文件', '524288', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('4582c275-12bd-488e-bd77-bed47e7cb29e', '节点设计', '/toDesignNode.action', '这是节点设计的权限', '256', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('4ac81bc8-db6c-459e-95f4-8221e8b828eb', '批量更新部门', '/toBatchUpdateDepartment.action', '这是批量更新部门的权限', '8388608', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('4d7df8dc-309b-43f5-a20c-5ec308dee59c', '批量更新权限', '/toBatchUpdateRight.action', '这是批量更新权限的权限', '2', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('551fe990-ee09-4371-af13-cf94045d104a', '查看表单', '/toFormAdmin.action', '这是查看表单的权限', '8192', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('7a7f600d-6519-4ed1-8cb4-3ed33727aacb', '查看流程', '/toProcedureAdmin.action', '这是查看流程的权限', '128', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('7af607d3-fac9-4082-ad14-d52176b15350', '批量更新员工', '/toBatchUpdateEmployee.action', '这是批量更新员工的权限', '1073741824', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('805a3c3d-48a2-4cbd-89d1-3791cf792bc7', '操作流程类型', '/toOperateProcedureType.action', '这是操作流程类型的权限', '8192', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('823be83d-c320-4ef7-b442-8c274c607673', '操作流程', '/toOperateProcedure.action', '这是操作流程的权限', '512', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('841d0933-f83f-4ac5-a7b1-33554308ce09', '删除角色', '/toDeleteRole.action', '这是删除角色的权限，包括批量删除', '64', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('84d61e06-3883-4934-948b-849419f0c9c6', '查看文件', '/toDocumentAdmin.action', '这是查看文件的权限', '256', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('8e49cdc2-ca90-44e4-b30b-f218d477de9d', '查看职位', '/toPositionAdmin.action', '这是查看职位的权限', '1', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('a265f387-2ad6-47e5-940f-b21120e381cb', '查看流程类型', '/toProcedureTypeAdmin.action', '这是查看流程类型的权限', '4096', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('a505364d-a67b-4618-a356-5f5c899dc18e', '关联权限', '/toLinkRight.action', '这是关联权限的权限', '128', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('a73c68be-dde4-45e9-a869-d0af44faecf7', '用户授权', '/toAuthorize.action', '这是用户授权的权限', '268435456', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('afd26c41-b86c-4869-b21d-d2675e06dcff', '设计表单', '/toDesignForm.action', '这是设计表单的权限', '32768', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('b91a702f-10a8-4776-bd01-6a72fa40195e', '操作职位', '/toOperatePosition.action', '这是操作职位的权限', '4', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('c1f8ec6a-c748-4e32-b5ac-0d7776a9be26', '编辑文件', '/toEditDocument.action', '这是在线编辑的文件', '2048', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('d3306958-1519-480d-b5ed-6047ba4d21c3', '查看部门', '/toDepartmentAdmin.action', '这是查看部门的权限', '2097152', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('d336a18d-0fed-425d-91dd-6994255cefae', '操作部门', '/toOperateDepartment.action', '这是操作部门的权限', '4194304', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('d82c4c8b-4495-43b5-aaf0-34946100b8e8', '办理事务', '/toHandleAffair.action', '这是办理事务的权限，包括发起流程', '32', '1', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('dc199018-148b-49e9-afad-b45d9bb014b5', '删除员工', '/toDeleteEmployee.action', '这是删除员工的权限，包括批量删除', '134217728', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('ea684c92-ed69-4298-9729-66b57b7b717c', '操作角色', '/toOperateRole.action', '这是操作角色的权限', '4', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('ebb22f09-adfc-4138-bae9-795498c09c0d', '删除文件', '/toDeleteDocument.action', '这是删除文件的权限，包括批量删除', '1024', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('f2aa58e7-3667-47d4-96f5-c56837af9225', '查看日志', '/toLogAdmin.action', '这是查看日志的权限', '1048576', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('fa7ba8bb-e536-45e7-ad35-39a68a924103', '操作员工', '/toOperateEmployee.action', '这是操作员工的权限', '536870912', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('fde638bd-845c-45f2-aa0b-8ecd562b404b', '删除部门', '/toDeleteDepartment.action', '这是删除部门的权限，包括批量删除', '16777216', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');
INSERT INTO `auth_right` VALUES ('ff7240ac-becb-45a5-9c11-49513a0cb39e', '文件共享', '/toShareDocument.action', '这是文件共享的权限', '4096', '0', '', '2019-06-03 22:51:10', '2019-06-03 22:51:10');

-- ----------------------------
-- Table structure for `auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` varchar(40) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `supper` bit(1) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1be92a7d98c14f8794af923bba315759', '员工角色', '', '这是操作员工的角色', '2019-06-03 22:51:50', '2019-06-03 22:51:51');
INSERT INTO `auth_role` VALUES ('4c58c313-3bbc-4917-8db0-9619ff45c25b', '超级管理员', '', '这是超级管理员角色，拥有所有权限', '2019-06-03 22:51:50', '2019-06-03 22:51:51');
INSERT INTO `auth_role` VALUES ('e6c7569273684f93ab5c060e4391747b', '查看部门角色', '', '这是查看部门的角色', '2019-06-03 22:51:50', '2019-06-03 22:51:51');
INSERT INTO `auth_role` VALUES ('fd723b411a284590a8485ac046b22cc5', '表单角色', '', '这是操作表单的角色', '2019-06-03 22:51:50', '2019-06-03 22:51:51');

-- ----------------------------
-- Table structure for `auth_role_right`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_right`;
CREATE TABLE `auth_role_right` (
  `role_id` varchar(40) DEFAULT NULL,
  `right_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_RIGHT` (`right_id`),
  KEY `FK_ROLE2` (`role_id`),
  CONSTRAINT `FK_RIGHT` FOREIGN KEY (`right_id`) REFERENCES `auth_right` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ROLE2` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_right
-- ----------------------------
INSERT INTO `auth_role_right` VALUES ('fd723b411a284590a8485ac046b22cc5', '551fe990-ee09-4371-af13-cf94045d104a', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('fd723b411a284590a8485ac046b22cc5', '063bda04-a333-47df-95f8-e12372656f75', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('fd723b411a284590a8485ac046b22cc5', 'afd26c41-b86c-4869-b21d-d2675e06dcff', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('fd723b411a284590a8485ac046b22cc5', '128c7c0d-c5ba-48fe-b095-833c391a4187', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('1be92a7d98c14f8794af923bba315759', '41e80c1b-3e7b-4b9c-9464-189b87e7a807', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('1be92a7d98c14f8794af923bba315759', 'dc199018-148b-49e9-afad-b45d9bb014b5', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('1be92a7d98c14f8794af923bba315759', 'a73c68be-dde4-45e9-a869-d0af44faecf7', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('1be92a7d98c14f8794af923bba315759', 'fa7ba8bb-e536-45e7-ad35-39a68a924103', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('1be92a7d98c14f8794af923bba315759', '7af607d3-fac9-4082-ad14-d52176b15350', '2019-06-03 22:52:08', '2019-06-03 22:52:08');
INSERT INTO `auth_role_right` VALUES ('e6c7569273684f93ab5c060e4391747b', 'd3306958-1519-480d-b5ed-6047ba4d21c3', '2019-06-03 22:52:08', '2019-06-03 22:52:08');

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` varchar(40) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `path` varchar(60) DEFAULT NULL,
  `disk` char(1) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL COMMENT '文件锁定，则不能编辑',
  `uploader_ID` varchar(40) DEFAULT NULL,
  `dep_id` varchar(40) DEFAULT NULL COMMENT '冗余字段，便于数据库查询',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_DOC_EMP` (`uploader_ID`),
  KEY `FK_DOC_DEP` (`dep_id`),
  CONSTRAINT `FK_DOC_DEP` FOREIGN KEY (`dep_id`) REFERENCES `member_department` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DOC_EMP` FOREIGN KEY (`uploader_ID`) REFERENCES `member_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES ('0ed14b246cea4657bebc922364064bfd', 'head.jpg', '总经办/2019-05-17', 'A', '2019-05-17 18:09:26', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('3e6b02f5-595b-4cca-b000-73e832ef7f76', '关于档案软件开发项目要求汇总表.xlsx', '总经办/2018-01-27', 'A', '2018-01-27 09:48:39', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('5777cc43-f43d-463c-836e-902bc796f249', '1 001.jpg', '总经办/2018-01-27', 'A', '2018-01-27 09:48:39', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('5872050c-3754-4685-be17-d221ce066cfb', 'zppt2327.pptx', '总经办/2018-01-27', 'A', '2018-01-27 09:48:39', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('98288352b308426f97feb2a5bca637e8', '6.jpg', 'IT部/2018-03-06', 'C', '2018-03-06 09:51:56', '', '4491db6d-5cb2-41d5-87cf-35213384bee2', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('989db424023b4998a9f7c48c7a594c7a', 'oa系统说明文档.docx', '总经办/2019-05-17', 'A', '2019-05-17 09:32:50', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('9f03303d-1883-4e30-9de1-29d476eee82b', 'generator.txt', '总经办/2018-01-27', 'A', '2018-01-27 09:48:39', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('9f97eda7-f5d1-43cc-b2da-4f51e0b3ca5c', 'oa系统说明文档.docx', '总经办/2018-01-27', 'A', '2018-01-27 09:48:39', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('a5060de1bbb9419db0f4448f5ed051ec', '7.jpg', 'IT部/2018-03-06', 'C', '2018-03-06 09:51:56', '', '4491db6d-5cb2-41d5-87cf-35213384bee2', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('b0e7fe16b4fd4d2ead1d8c242b9251db', '13.zip', 'IT部/2018-03-06', 'B', '2018-03-06 09:54:18', '', '4491db6d-5cb2-41d5-87cf-35213384bee2', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('c8327d7ea27e487fba8112ac92acf834', '8.jpg', 'IT部/2018-03-06', 'C', '2018-03-06 09:51:56', '', '4491db6d-5cb2-41d5-87cf-35213384bee2', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:52:18', '2019-06-03 22:52:18');
INSERT INTO `document` VALUES ('fc551b40ecd54fc584caf7db307c14a9', '今日任务.txt', '总经办/2019-05-17', 'A', '2019-05-17 18:09:26', '', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:52:18', '2019-06-03 22:52:18');

-- ----------------------------
-- Table structure for `form`
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `content` text,
  `version` int(11) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES ('4d7fd2c5-061e-457e-a4c1-83601e3c739e', '招聘申请表单', '<tbody> <tr rownum=\'1\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'1\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>申请部门 </td> <td isselected=\'false\' rownum=\'1\' colnum=\'2\' rowspan=\'1\' colspan=\'2\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <select name=\'申请部门\' code=\'sqbm\' oncontextmenu=\'$.fn.contContextmenu(this, 12)\' controltype=\'12\' style=\'background-color: white; width: 80%; height: 30px;\'></select></td> <td isselected=\'false\' rownum=\'1\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>申请日期 </td> <td isselected=\'false\' rownum=\'1\' colnum=\'5\' rowspan=\'1\' colspan=\'2\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'申请日期\' code=\'sqrq\' id=\'sqrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 6)\' controltype=\'6\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'2\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'2\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>申请人数 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'申请人数\' code=\'sqrs\' defaultvalue=\'\' placeholder=\'请输入申请人数\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'2\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>职位名称 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'职位名称\' code=\'zwmc\' defaultvalue=\'\' placeholder=\'请输入职位名称\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'2\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>原有人数 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'原有人数\' code=\'yyrs\' defaultvalue=\'\' placeholder=\'请输入原有人数\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'3\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'3\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>职务类别 </td> <td isselected=\'false\' rownum=\'3\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <div name=\'职务类别\' code=\'zwlb\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\'background-color: white; width: 80%; height: 30px;\'><input type=\'radio\' name=\'zwlb\' value=\'新增\' style=\'cursor: pointer;\'>新增&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'职员\' style=\'cursor: pointer;\'>职员&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'临时\' style=\'cursor: pointer;\'>临时&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'工人\' style=\'cursor: pointer;\'>工人&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'其他\' style=\'cursor: pointer;\'>其他&nbsp;&nbsp;&nbsp;</div></td> </tr> <tr rownum=\'4\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'4\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>增加/补充人员理由</td> <td isselected=\'false\' rownum=\'4\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <textarea name=\'增加人员理由\' code=\'zjryly\' defaultvalue=\'\' placeholder=\'请输入增加人员理由\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea></td> </tr> <tr rownum=\'5\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'5\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>招聘相关要求</td> <td isselected=\'false\' rownum=\'5\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <textarea name=\'招聘相关要求\' code=\'zpxgyq\' defaultvalue=\'\' placeholder=\'请输入招聘相关要求\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea></td> </tr> <tr rownum=\'6\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'6\' colnum=\'1\' rowspan=\'2\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>拟合工资 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>试用期</td> <td isselected=\'false\' rownum=\'6\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>月薪 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'试用月薪\' code=\'syyx\' defaultvalue=\'\' placeholder=\'请输入试用月薪\' joincaculate=\'synx\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'6\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>年薪 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'试用年薪\' code=\'synx\' placeholder=\'syyx*12\' decimalbit=\'2\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' controltype=\'9\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'7\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'7\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>转正 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>月薪 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'转正月薪\' code=\'zzyx\' defaultvalue=\'\' placeholder=\'请输入转正月薪\' joincaculate=\'zznx\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'7\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>年薪 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'转正年薪\' code=\'zznx\' placeholder=\'zzyx*12\' decimalbit=\'2\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' controltype=\'9\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'8\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'8\' colnum=\'1\' rowspan=\'1\' colspan=\'6\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>招聘人员条件</td> </tr> <tr rownum=\'9\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'9\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>教育程度 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <select name=\'教育程度\' code=\'jycd\' oncontextmenu=\'$.fn.contContextmenu(this, 3)\' controltype=\'3\' style=\'background-color: white; width: 80%; height: 30px;\'><option value=\'无\'>无</option><option value=\'小学\'>小学</option><option value=\'初中\'>初中</option><option value=\'高中\'>高中</option><option value=\'本科及以上\'>本科及以上</option></select></td> <td isselected=\'false\' rownum=\'9\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>性别 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <div name=\'性别\' code=\'xb\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\'background-color: white; width: 80%; height: 30px;\'><input type=\'radio\' name=\'xb\' value=\'男\' style=\'cursor: pointer;\'>男&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'xb\' value=\'女\' style=\'cursor: pointer;\'>女&nbsp;&nbsp;&nbsp;</div></td> <td isselected=\'false\' rownum=\'9\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>年龄 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <input type=\'text\' name=\'年龄\' code=\'nl\' defaultvalue=\'\' placeholder=\'请输入年龄\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'10\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'10\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>工作经验 </td> <td isselected=\'false\' rownum=\'10\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <div name=\'工作经验\' code=\'gzjy\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\'background-color: white; width: 80%; height: 30px;\'><input type=\'radio\' name=\'gzjy\' value=\'无\' style=\'cursor: pointer;\'>无&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'一年\' style=\'cursor: pointer;\'>一年&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'两年\' style=\'cursor: pointer;\'>两年&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'3-5年\' style=\'cursor: pointer;\'>3-5年&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'5年以上\' style=\'cursor: pointer;\'>5年以上&nbsp;&nbsp;&nbsp;</div></td> </tr> <tr rownum=\'11\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'11\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>职称证书 </td> <td isselected=\'false\' rownum=\'11\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <div name=\'职称证书\' code=\'zczs\' oncontextmenu=\'$.fn.contContextmenu(this, 5)\' controltype=\'5\' style=\'background-color: white; width: 80%; height: 30px;\'><input type=\'checkbox\' name=\'zczs\' value=\'无\' style=\'cursor: pointer;\'>无&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'zczs\' value=\'初级\' style=\'cursor: pointer;\'>初级&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'zczs\' value=\'中级\' style=\'cursor: pointer;\'>中级&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'zczs\' value=\'高级\' style=\'cursor: pointer;\'>高级&nbsp;&nbsp;&nbsp;</div></td> </tr> <tr rownum=\'12\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'12\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>申请部门意见</td> <td isselected=\'false\' rownum=\'12\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <textarea name=\'申请部门意见\' code=\'sqbmyj\' defaultvalue=\'\' placeholder=\'请输入申请部门意见\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea><br>申请部门签字：<input type=\'text\' name=\'申请部门签字\' code=\'sqbmqz\' value=\'张三_总经办\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\'background-color: white; width: 50%; height: 30px;\'><br>签字日期：<input type=\'text\' name=\'签字日期\' code=\'bmqzrq\' id=\'bmqzrq\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\'background-color: white; width: 50%; height: 30px;\'></td> </tr> <tr rownum=\'13\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'13\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>人事行政意见</td> <td isselected=\'false\' rownum=\'13\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <textarea name=\'人事行政意见\' code=\'rsxzyj\' defaultvalue=\'\' placeholder=\'请输入人事行政意见\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea><br>人事行政签字：<input type=\'text\' name=\'人事行政签字\' code=\'rsxzqz\' value=\'张三_总经办\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\'background-color: white; width: 50%; height: 30px;\'><br>签字日期：<input type=\'text\' name=\'人事签字日期\' code=\'rsqzrq\' id=\'rsqzrq\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\'background-color: white; width: 50%; height: 30px;\'></td> </tr> <tr rownum=\'14\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'14\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>直接上级意见 </td> <td isselected=\'false\' rownum=\'14\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <textarea name=\'直接上级意见\' code=\'zjsjyj\' defaultvalue=\'\' placeholder=\'请输入直接上级意见\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea><br>直接上级签字：<input type=\'text\' name=\'直接上级签字\' code=\'zjsjqz\' value=\'张三_总经办\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\'background-color: white; width: 50%; height: 30px;\'><br>签字日期：<input type=\'text\' name=\'上级签字日期\' code=\'sjqzrq\' id=\'sjqzrq\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\'background-color: white; width: 50%; height: 30px;\'></td> </tr> <tr rownum=\'15\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'15\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'>总经理审批</td> <td isselected=\'false\' rownum=\'15\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 351.75px; background-color: white;\'> <textarea name=\'总经理审批\' code=\'zjlsp\' defaultvalue=\'\' placeholder=\'请输入总经理审批\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea><br>总经理签字：<input type=\'text\' name=\'总经理签字\' code=\'zjlqz\' value=\'张三_总经办\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\'background-color: white; width: 50%; height: 30px;\'><br>签字日期：<input type=\'text\' name=\'总经理签字日期\' code=\'zjlqzrq\' id=\'zjlqzrq\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\'background-color: white; width: 50%; height: 30px;\'></td> </tr><tr align=\'center\' rownum=\'16\' style=\'cursor: default;\'><td rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' rownum=\'16\' colnum=\'1\' isselected=\'false\' style=\'background-color: white; width: 351.75px;\'>董事长审批</td><td rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' rownum=\'16\' colnum=\'2\' isselected=\'true\' style=\'background-color: white; width: 351.75px;\'><textarea name=\'董事长审批\' code=\'dszsp\' defaultvalue=\'\' placeholder=\'请输入董事长签字\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea><br>董事长签字：<input type=\'text\' name=\'董事长签字\' code=\'dszqz\' value=\'张三_总经办\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\'background-color: white; width: 50%; height: 30px;\'><br>签字日期：<input type=\'text\' name=\'董事长签字日期\' code=\'dszqzrq\' id=\'dszqzrq\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\'background-color: white; width: 50%; height: 30px;\'></td></tr> </tbody>', '2', '2019-06-03 22:52:34', '2019-06-03 22:52:35');
INSERT INTO `form` VALUES ('66297dfc-8de4-4ee5-b10a-8f96405b45f2', '招聘申请表单', '<tbody> <tr rownum=\'1\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'1\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>申请部门 </td> <td isselected=\'false\' rownum=\'1\' colnum=\'2\' rowspan=\'1\' colspan=\'2\' contenteditable=\'true\' style=\'width: 348px; \'> <select name=\'申请部门\' code=\'sqbm\' oncontextmenu=\'$.fn.contContextmenu(this, 12)\' controltype=\'12\' style=\' width: 80%; height: 30px;\'></select></td> <td isselected=\'false\' rownum=\'1\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>申请日期 </td> <td isselected=\'false\' rownum=\'1\' colnum=\'5\' rowspan=\'1\' colspan=\'2\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'申请日期\' code=\'sqrq\' id=\'sqrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 6)\' controltype=\'6\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'2\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'2\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>申请人数 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'申请人数\' code=\'sqrs\' defaultvalue=\'\' placeholder=\'请输入申请人数\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'2\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>职位名称 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'职位名称\' code=\'zwmc\' defaultvalue=\'\' placeholder=\'请输入职位名称\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'2\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>原有人数 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'原有人数\' code=\'yyrs\' defaultvalue=\'\' placeholder=\'请输入原有人数\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'3\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'3\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>职务类别 </td> <td isselected=\'false\' rownum=\'3\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <div name=\'职务类别\' code=\'zwlb\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\' width: 80%; height: 30px;\'><input type=\'radio\' name=\'zwlb\' value=\'新增\' style=\'cursor: pointer;\'>新增&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'职员\' style=\'cursor: pointer;\'>职员&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'临时\' style=\'cursor: pointer;\'>临时&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'工人\' style=\'cursor: pointer;\'>工人&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'其他\' style=\'cursor: pointer;\'>其他&nbsp;&nbsp;&nbsp;</div></td> </tr> <tr rownum=\'4\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'4\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>增加/补充人员理由</td> <td isselected=\'false\' rownum=\'4\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <textarea name=\'增加人员理由\' code=\'zjryly\' defaultvalue=\'\' placeholder=\'请输入增加人员理由\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\' width: 80%;\'></textarea></td> </tr> <tr rownum=\'5\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'5\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>招聘相关要求</td> <td isselected=\'false\' rownum=\'5\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <textarea name=\'招聘相关要求\' code=\'zpxgyq\' defaultvalue=\'\' placeholder=\'请输入招聘相关要求\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\' width: 80%;\'></textarea></td> </tr> <tr rownum=\'6\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'6\' colnum=\'1\' rowspan=\'2\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>拟合工资 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>试用期</td> <td isselected=\'false\' rownum=\'6\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>月薪 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'试用月薪\' code=\'syyx\' defaultvalue=\'\' placeholder=\'请输入试用月薪\' joincaculate=\'synx\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'6\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>年薪 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'试用年薪\' code=\'synx\' placeholder=\'syyx*12\' decimalbit=\'2\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' controltype=\'9\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'7\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'7\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>转正 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>月薪 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'转正月薪\' code=\'zzyx\' defaultvalue=\'\' placeholder=\'请输入转正月薪\' joincaculate=\'zznx\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'7\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>年薪 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'转正年薪\' code=\'zznx\' placeholder=\'zzyx*12\' decimalbit=\'2\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' controltype=\'9\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'8\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'8\' colnum=\'1\' rowspan=\'1\' colspan=\'6\' contenteditable=\'true\' style=\'width: 348px; \'>招聘人员条件</td> </tr> <tr rownum=\'9\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'9\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>教育程度 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <select name=\'教育程度\' code=\'jycd\' oncontextmenu=\'$.fn.contContextmenu(this, 3)\' controltype=\'3\' style=\' width: 80%; height: 30px;\'><option value=\'无\'>无</option><option value=\'小学\'>小学</option><option value=\'初中\'>初中</option><option value=\'高中\'>高中</option><option value=\'本科及以上\'>本科及以上</option></select></td> <td isselected=\'false\' rownum=\'9\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>性别 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <div name=\'性别\' code=\'xb\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\' width: 80%; height: 30px;\'><input type=\'radio\' name=\'xb\' value=\'男\' style=\'cursor: pointer;\'>男&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'xb\' value=\'女\' style=\'cursor: pointer;\'>女&nbsp;&nbsp;&nbsp;</div></td> <td isselected=\'false\' rownum=\'9\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>年龄 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'> <input type=\'text\' name=\'年龄\' code=\'nl\' defaultvalue=\'\' placeholder=\'请输入年龄\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\' width: 80%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'10\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'10\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>工作经验 </td> <td isselected=\'false\' rownum=\'10\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <div name=\'工作经验\' code=\'gzjy\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\' width: 80%; height: 30px;\'><input type=\'radio\' name=\'gzjy\' value=\'无\' style=\'cursor: pointer;\'>无&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'一年\' style=\'cursor: pointer;\'>一年&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'两年\' style=\'cursor: pointer;\'>两年&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'3-5年\' style=\'cursor: pointer;\'>3-5年&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'gzjy\' value=\'5年以上\' style=\'cursor: pointer;\'>5年以上&nbsp;&nbsp;&nbsp;</div></td> </tr> <tr rownum=\'11\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'11\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>职称证书 </td> <td isselected=\'false\' rownum=\'11\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <div name=\'职称证书\' code=\'zczs\' oncontextmenu=\'$.fn.contContextmenu(this, 5)\' controltype=\'5\' style=\' width: 80%; height: 30px;\'><input type=\'checkbox\' name=\'zczs\' value=\'无\' style=\'cursor: pointer;\'>无&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'zczs\' value=\'初级\' style=\'cursor: pointer;\'>初级&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'zczs\' value=\'中级\' style=\'cursor: pointer;\'>中级&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'zczs\' value=\'高级\' style=\'cursor: pointer;\'>高级&nbsp;&nbsp;&nbsp;</div></td> </tr> <tr rownum=\'12\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'12\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>申请部门意见</td> <td isselected=\'false\' rownum=\'12\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <textarea name=\'申请部门意见\' code=\'sqbmyj\' defaultvalue=\'\' placeholder=\'请输入申请部门意见\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\' width: 80%;\'></textarea><br>申请部门签字：<input type=\'text\' name=\'申请部门签字\' code=\'sqbmqz\'  readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'><br>签字日期：<input type=\'text\' name=\'签字日期\' code=\'bmqzrq\' id=\'bmqzrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'13\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'13\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>人事行政意见</td> <td isselected=\'false\' rownum=\'13\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <textarea name=\'人事行政意见\' code=\'rsxzyj\' defaultvalue=\'\' placeholder=\'请输入人事行政意见\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\' width: 80%;\'></textarea><br>人事行政签字：<input type=\'text\' name=\'人事行政签字\' code=\'rsxzqz\'  readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'><br>签字日期：<input type=\'text\' name=\'人事签字日期\' code=\'rsqzrq\' id=\'rsqzrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'14\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'14\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>直接上级意见 </td> <td isselected=\'false\' rownum=\'14\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <textarea name=\'直接上级意见\' code=\'zjsjyj\' defaultvalue=\'\' placeholder=\'请输入直接上级意见\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\' width: 80%;\'></textarea><br>直接上级签字：<input type=\'text\' name=\'直接上级签字\' code=\'zjsjqz\'  readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'><br>签字日期：<input type=\'text\' name=\'上级签字日期\' code=\'sjqzrq\' id=\'sjqzrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'></td> </tr> <tr rownum=\'15\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'15\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 348px; \'>总经理审批</td> <td isselected=\'false\' rownum=\'15\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 348px; \'> <textarea name=\'总经理审批\' code=\'zjlsp\' defaultvalue=\'\' placeholder=\'请输入总经理审批\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\' width: 80%;\'></textarea><br>总经理签字：<input type=\'text\' name=\'总经理签字\' code=\'zjlqz\'  readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'><br>签字日期：<input type=\'text\' name=\'总经理签字日期\' code=\'zjlqzrq\' id=\'zjlqzrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'></td> </tr><tr align=\'center\' rownum=\'16\' style=\'cursor: default;\'><td rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' rownum=\'16\' colnum=\'1\' isselected=\'false\' style=\' width: 348px;\'>董事长审批</td><td rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' rownum=\'16\' colnum=\'2\' isselected=\'true\' style=\' width: 348px;\'><textarea name=\'董事长审批\' code=\'dszsp\' defaultvalue=\'\' placeholder=\'请输入董事长签字\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\' width: 80%;\'></textarea><br>董事长签字：<input type=\'text\' name=\'董事长签字\' code=\'dszqz\'  readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 10)\' controltype=\'10\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\'><br>签字日期：<input type=\'text\' name=\'董事长签字日期\' code=\'dszqzrq\' id=\'dszqzrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' controltype=\'8\' style=\' width: 50%; height: 30px;\' autocomplete=\'off\' placeholder=\'请选择董事长签字日期\' datetype=\'datetime\'></td></tr> </tbody>', '3', '2019-06-03 22:52:34', '2019-06-03 22:52:35');
INSERT INTO `form` VALUES ('7d241fa349484c2a8770083ffaab620e', '转账支付单', null, '0', '2019-06-03 22:52:34', '2019-06-03 22:52:35');
INSERT INTO `form` VALUES ('9ce57d6a-1fbc-4c9e-bfc9-739983122361', '招聘申请表单', '<tbody> <tr rownum=\'1\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'1\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>申请部门 </td> <td isselected=\'false\' rownum=\'1\' colnum=\'2\' rowspan=\'1\' colspan=\'2\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <select name=\'申请部门\' code=\'sqbm\' oncontextmenu=\'$.fn.contContextmenu(this, 12)\' controltype=\'12\' style=\'background-color: white; width: 80%; height: 30px;\'></select></td> <td isselected=\'false\' rownum=\'1\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>申请日期 </td> <td isselected=\'false\' rownum=\'1\' colnum=\'5\' rowspan=\'1\' colspan=\'2\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'申请日期\' code=\'sqrq\' id=\'sqrq\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 6)\' controltype=\'6\' style=\'background-color: white; width: 80%; height: 30px;\'></td> </tr> <tr rownum=\'2\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'2\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>申请人数 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'申请人数\' code=\'sqrs\' defaultvalue=\'\' placeholder=\'请输入申请人数\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\'></td> <td isselected=\'false\' rownum=\'2\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>职位名称 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'职位名称\' code=\'zwmc\' defaultvalue=\'\' placeholder=\'请输入职位名称\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\'></td> <td isselected=\'false\' rownum=\'2\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>原有人数 </td> <td isselected=\'false\' rownum=\'2\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'原有人数\' code=\'yyrs\' defaultvalue=\'\' placeholder=\'请输入原有人数\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\'></td> </tr> <tr rownum=\'3\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'3\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>职务类别 </td> <td isselected=\'false\' rownum=\'3\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <div name=\'职务类别\' code=\'zwlb\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\'background-color: white; width: 80%; height: 30px;\'><input type=\'radio\' name=\'zwlb\' value=\'新增\' style=\'cursor: pointer;\'>新增&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'职员\' style=\'cursor: pointer;\'>职员&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'临时\' style=\'cursor: pointer;\'>临时&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'工人\' style=\'cursor: pointer;\'>工人&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'zwlb\' value=\'其他\' style=\'cursor: pointer;\'>其他&nbsp;&nbsp;&nbsp;</div></td> </tr> <tr rownum=\'4\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'4\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>增加/补充人员理由</td> <td isselected=\'false\' rownum=\'4\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <textarea name=\'增加人员理由\' code=\'zjryly\' defaultvalue=\'\' placeholder=\'请输入增加人员理由\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea></td> </tr> <tr rownum=\'5\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'5\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>招聘相关要求</td> <td isselected=\'false\' rownum=\'5\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <textarea name=\'招聘相关要求\' code=\'zpxgyq\' defaultvalue=\'\' placeholder=\'请输入招聘相关要求\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' controltype=\'2\' style=\'background-color: white; width: 80%;\'></textarea></td> </tr> <tr rownum=\'6\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'6\' colnum=\'1\' rowspan=\'2\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>拟合工资 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>试用期</td> <td isselected=\'false\' rownum=\'6\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>月薪 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'试用月薪\' code=\'syyx\' defaultvalue=\'\' placeholder=\'请输入试用月薪\' joincaculate=\'synx\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\'></td> <td isselected=\'false\' rownum=\'6\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>年薪 </td> <td isselected=\'false\' rownum=\'6\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'试用年薪\' code=\'synx\' placeholder=\'syyx*12\' decimalbit=\'2\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' controltype=\'9\' style=\'background-color: white; width: 80%; height: 30px;\'></td> </tr> <tr rownum=\'7\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'7\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>转正 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>月薪 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'转正月薪\' code=\'zzyx\' defaultvalue=\'\' placeholder=\'请输入转正月薪\' joincaculate=\'zznx\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\'></td> <td isselected=\'false\' rownum=\'7\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>年薪 </td> <td isselected=\'false\' rownum=\'7\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'转正年薪\' code=\'zznx\' placeholder=\'zzyx*12\' decimalbit=\'2\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' controltype=\'9\' style=\'background-color: white; width: 80%; height: 30px;\'></td> </tr> <tr rownum=\'8\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'8\' colnum=\'1\' rowspan=\'1\' colspan=\'6\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>招聘人员条件</td> </tr> <tr rownum=\'9\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'9\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>教育程度 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <select name=\'教育程度\' code=\'jycd\' oncontextmenu=\'$.fn.contContextmenu(this, 3)\' controltype=\'3\' style=\'background-color: white; width: 80%; height: 30px;\'><option value=\'无\'>无</option><option value=\'小学\'>小学</option><option value=\'初中\'>初中</option><option value=\'高中\'>高中</option><option value=\'本科及以上\'>本科及以上</option></select></td> <td isselected=\'false\' rownum=\'9\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>性别 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <div name=\'性别\' code=\'xb\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' controltype=\'4\' style=\'background-color: white; width: 80%; height: 30px;\'><input type=\'radio\' name=\'xb\' value=\'男\' style=\'cursor: pointer;\'>男&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'xb\' value=\'女\' style=\'cursor: pointer;\'>女&nbsp;&nbsp;&nbsp;</div></td> <td isselected=\'false\' rownum=\'9\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>年龄 </td> <td isselected=\'false\' rownum=\'9\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> <input type=\'text\' name=\'年龄\' code=\'nl\' defaultvalue=\'\' placeholder=\'请输入年龄\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' controltype=\'1\' style=\'background-color: white; width: 80%; height: 30px;\'></td> </tr> <tr rownum=\'10\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'10\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>工作经验 </td> <td isselected=\'true\' rownum=\'10\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: rgb(245, 245, 245);\'> </td> </tr> <tr rownum=\'11\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'11\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>职称证书 </td> <td isselected=\'false\' rownum=\'11\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> </td> </tr> <tr rownum=\'12\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'12\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>申请部门意见</td> <td isselected=\'false\' rownum=\'12\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> </td> </tr> <tr rownum=\'13\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'13\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>人事行政意见</td> <td isselected=\'false\' rownum=\'13\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> </td> </tr> <tr rownum=\'14\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'14\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>直接上级意见 </td> <td isselected=\'false\' rownum=\'14\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> </td> </tr> <tr rownum=\'15\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'15\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'>总经理审批</td> <td isselected=\'false\' rownum=\'15\' colnum=\'2\' rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' style=\'width: 234.5px; background-color: white;\'> </td> </tr><tr align=\'center\' rownum=\'16\' style=\'cursor: default;\'><td rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' rownum=\'16\' colnum=\'1\' isselected=\'false\' style=\'background-color: white;\'>董事长审批</td><td rowspan=\'1\' colspan=\'5\' contenteditable=\'true\' rownum=\'16\' colnum=\'2\' isselected=\'false\' style=\'background-color: white;\'></td></tr> </tbody>', '1', '2019-06-03 22:52:34', '2019-06-03 22:52:35');
INSERT INTO `form` VALUES ('b159b7bd-b6c0-4e7b-8cbf-5584fd337a7f', '测试表单', '<tbody> <tr rownum=\'1\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'1\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'默认值单行文本\' code=\'mrzdhwb\' defaultvalue=\'默认值\' placeholder=\'请输入默认值单行文本\' joincaculate=\'\' value=\'默认值\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' class=\'\' controltype=\'1\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'1\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'单行文本\' code=\'dhwb\' defaultvalue=\'\' placeholder=\'请输入单行文本\' joincaculate=\'\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' class=\'\' controltype=\'1\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'1\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <select name=\'下拉菜单\' code=\'xlcd\' oncontextmenu=\'$.fn.contContextmenu(this, 3)\' class=\'\' controltype=\'3\' style=\'width: 80%; height: 30px; \'><option value=\'A\'>A</option><option value=\'B\'>B</option><option value=\'C\'>C</option><option value=\'D\'>D</option></select></td> <td isselected=\'false\' rownum=\'1\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <div name=\'单选按钮\' code=\'dxan\' oncontextmenu=\'$.fn.contContextmenu(this, 4)\' class=\'\' controltype=\'4\' style=\'width: 80%; height: 30px; \'><input type=\'radio\' name=\'dxan\' value=\'A\' style=\'cursor: pointer;\'>A&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'dxan\' value=\'B\' style=\'cursor: pointer;\'>B&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'dxan\' value=\'C\' style=\'cursor: pointer;\'>C&nbsp;&nbsp;&nbsp;<input type=\'radio\' name=\'dxan\' value=\'D\' style=\'cursor: pointer;\'>D&nbsp;&nbsp;&nbsp;</div></td> <td isselected=\'false\' rownum=\'1\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <div name=\'复选框\' code=\'fxk\' oncontextmenu=\'$.fn.contContextmenu(this, 5)\' class=\'\' controltype=\'5\' style=\'width: 80%; height: 30px; \'><input type=\'checkbox\' name=\'fxk\' value=\'A\' style=\'cursor: pointer;\'>A&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'fxk\' value=\'B\' style=\'cursor: pointer;\'>B&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'fxk\' value=\'C\' style=\'cursor: pointer;\'>C&nbsp;&nbsp;&nbsp;<input type=\'checkbox\' name=\'fxk\' value=\'D\' style=\'cursor: pointer;\'>D&nbsp;&nbsp;&nbsp;</div></td> <td isselected=\'false\' rownum=\'1\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'2\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'2\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <textarea name=\'默认值多行文本\' code=\'Mrzdhwb\' defaultvalue=\'默认值\' placeholder=\'请输入默认值多行文本\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' class=\'\' controltype=\'2\' style=\'width: 79%; \'>默认值</textarea></td> <td isselected=\'false\' rownum=\'2\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <textarea name=\'多行文本\' code=\'Dhwb\' defaultvalue=\'\' placeholder=\'请输入多行文本\' rows=\'3\' oncontextmenu=\'$.fn.contContextmenu(this, 2)\' class=\'\' controltype=\'2\' style=\'width: 80%; \'></textarea></td> <td isselected=\'false\' rownum=\'2\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'2\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'2\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'2\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'3\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'3\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'当前日期\' code=\'dqrq\' id=\'dqrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 6)\' class=\'\' controltype=\'6\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'3\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'可选日期\' code=\'kxrq\' id=\'kxrq\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 6)\' placeholder=\'请选择可选日期\' datetype=\'date\' class=\'\' controltype=\'6\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\' lay-key=\'1\'></td> <td isselected=\'false\' rownum=\'3\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'当前时间\' code=\'dqsj\' id=\'dqsj\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 7)\' class=\'\' controltype=\'7\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'3\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'可选时间\' code=\'kxsj\' id=\'kxsj\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 7)\' placeholder=\'请选择可选时间\' datetype=\'time\' class=\'\' controltype=\'7\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\' lay-key=\'2\'></td> <td isselected=\'false\' rownum=\'3\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'当前日期时间\' code=\'dqrqsj\' id=\'dqrqsj\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' class=\'\' controltype=\'8\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'3\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'可选日期时间\' code=\'kxrqsj\' id=\'kxrqsj\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 8)\' placeholder=\'请选择可选日期时间\' datetype=\'datetime\' class=\'\' controltype=\'8\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\' lay-key=\'3\'></td> </tr> <tr rownum=\'4\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'4\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'计算参数a\' code=\'a\' defaultvalue=\'\' placeholder=\'请输入计算参数a\' joincaculate=\'d_e\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' class=\'\' controltype=\'1\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'4\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'计算参数b\' code=\'b\' defaultvalue=\'\' placeholder=\'请输入计算参数b\' joincaculate=\'d_e\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' class=\'\' controltype=\'1\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'4\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'计算参数c\' code=\'c\' defaultvalue=\'\' placeholder=\'请输入计算参数c\' joincaculate=\'d_e\' value=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 1)\' class=\'\' controltype=\'1\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'4\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'计算控件d\' code=\'d\' placeholder=\'10*(a+b)+c\' decimalbit=\'2\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' class=\'\' controltype=\'9\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'4\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'计算控件e\' code=\'e\' placeholder=\'a*b*c\' decimalbit=\'4\' \'=\'\' readonly=\'\' oncontextmenu=\'$.fn.contContextmenu(this, 9)\' class=\'\' controltype=\'9\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'4\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'5\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'5\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <input type=\'text\' name=\'人员选择框\' code=\'ryxzk\' placeholder=\'请选择员工\' oncontextmenu=\'$.fn.contContextmenu(this, 11)\' class=\'\' controltype=\'11\' style=\'width: 80%; height: 30px; \' autocomplete=\'off\'></td> <td isselected=\'false\' rownum=\'5\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> <select name=\'部门选择框\' code=\'bmxzk\' oncontextmenu=\'$.fn.contContextmenu(this, 12)\' class=\'\' controltype=\'12\' style=\'width: 80%; height: 30px; \'></select></td> <td isselected=\'false\' rownum=\'5\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'5\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'5\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'5\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'6\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'6\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'6\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'6\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'6\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'6\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'6\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'7\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'7\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'7\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'true\' rownum=\'7\' colnum=\'3\' rowspan=\'3\' colspan=\'2\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'7\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'7\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'8\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'8\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'8\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'8\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'8\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'9\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'9\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'9\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'9\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'9\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'10\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'10\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'10\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'10\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'10\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'10\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'10\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'11\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'11\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'11\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'11\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'11\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'11\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'11\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'12\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'12\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'12\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'12\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'12\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'12\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'12\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'13\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'13\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'13\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'13\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'13\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'13\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'13\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'14\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'14\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'14\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'14\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'14\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'14\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'14\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> <tr rownum=\'15\' align=\'center\' style=\'cursor: default;\'> <td isselected=\'false\' rownum=\'15\' colnum=\'1\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'15\' colnum=\'2\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'15\' colnum=\'3\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'15\' colnum=\'4\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'15\' colnum=\'5\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> <td isselected=\'false\' rownum=\'15\' colnum=\'6\' rowspan=\'1\' colspan=\'1\' contenteditable=\'true\' style=\'width: 234.5px; \'> </td> </tr> </tbody>', '2', '2019-06-03 22:52:34', '2019-06-03 22:52:35');

-- ----------------------------
-- Table structure for `group_document`
-- ----------------------------
DROP TABLE IF EXISTS `group_document`;
CREATE TABLE `group_document` (
  `group_id` varchar(40) DEFAULT NULL,
  `doc_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_Reference_15` (`group_id`),
  KEY `FK_Reference_16` (`doc_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`group_id`) REFERENCES `group_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`doc_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_document
-- ----------------------------
INSERT INTO `group_document` VALUES ('be3f68ad-630c-4cfe-bc50-be0195c4eefd', '9f03303d-1883-4e30-9de1-29d476eee82b', '2019-06-03 22:52:49', '2019-06-03 22:52:49');
INSERT INTO `group_document` VALUES ('8825fb5f-c164-400b-998a-2a40395b456d', '9f97eda7-f5d1-43cc-b2da-4f51e0b3ca5c', '2019-06-03 22:52:49', '2019-06-03 22:52:49');
INSERT INTO `group_document` VALUES ('bfc2c891-a69d-4491-a34b-1e69d10dd0a8', '9f97eda7-f5d1-43cc-b2da-4f51e0b3ca5c', '2019-06-03 22:52:49', '2019-06-03 22:52:49');
INSERT INTO `group_document` VALUES ('0d7f4fe9-0245-419c-b802-4b25072b76b3', '98288352b308426f97feb2a5bca637e8', '2019-06-03 22:52:49', '2019-06-03 22:52:49');
INSERT INTO `group_document` VALUES ('0d7f4fe9-0245-419c-b802-4b25072b76b3', 'b0e7fe16b4fd4d2ead1d8c242b9251db', '2019-06-03 22:52:49', '2019-06-03 22:52:49');
INSERT INTO `group_document` VALUES ('7288ddc2-bc65-4a70-b547-56733a1abf1f', 'c8327d7ea27e487fba8112ac92acf834', '2019-06-03 22:52:49', '2019-06-03 22:52:49');

-- ----------------------------
-- Table structure for `group_employee`
-- ----------------------------
DROP TABLE IF EXISTS `group_employee`;
CREATE TABLE `group_employee` (
  `group_id` varchar(40) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_Reference_14` (`group_id`),
  KEY `FK_Reference_13` (`emp_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`emp_id`) REFERENCES `member_employee` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`group_id`) REFERENCES `group_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_employee
-- ----------------------------
INSERT INTO `group_employee` VALUES ('203f8de0-485e-45a6-b15a-7fdb5d84f7f6', '1bd7274cd0ee483f8bbe86c4eda707c9', '2019-06-03 22:52:59', '2019-06-03 22:52:59');
INSERT INTO `group_employee` VALUES ('35567df3-357b-42be-97f1-30f1d9309d3e', '1bd7274cd0ee483f8bbe86c4eda707c9', '2019-06-03 22:52:59', '2019-06-03 22:52:59');
INSERT INTO `group_employee` VALUES ('cb5fa9cd-3afd-4272-afa5-3dcef768eff7', '1bd7274cd0ee483f8bbe86c4eda707c9', '2019-06-03 22:52:59', '2019-06-03 22:52:59');
INSERT INTO `group_employee` VALUES ('0d7f4fe9-0245-419c-b802-4b25072b76b3', 'ce2172ab-4e87-418e-b349-b5b5e627b2dd', '2019-06-03 22:52:59', '2019-06-03 22:52:59');
INSERT INTO `group_employee` VALUES ('7288ddc2-bc65-4a70-b547-56733a1abf1f', 'ce2172ab-4e87-418e-b349-b5b5e627b2dd', '2019-06-03 22:52:59', '2019-06-03 22:52:59');
INSERT INTO `group_employee` VALUES ('be3f68ad-630c-4cfe-bc50-be0195c4eefd', '1bd7274cd0ee483f8bbe86c4eda707c9', '2019-06-03 22:52:59', '2019-06-03 22:52:59');
INSERT INTO `group_employee` VALUES ('be3f68ad-630c-4cfe-bc50-be0195c4eefd', '4491db6d-5cb2-41d5-87cf-35213384bee2', '2019-06-03 22:52:59', '2019-06-03 22:52:59');
INSERT INTO `group_employee` VALUES ('be3f68ad-630c-4cfe-bc50-be0195c4eefd', 'a19f881e-c79b-472b-87f4-b8434eab107b', '2019-06-03 22:52:59', '2019-06-03 22:52:59');

-- ----------------------------
-- Table structure for `group_group`
-- ----------------------------
DROP TABLE IF EXISTS `group_group`;
CREATE TABLE `group_group` (
  `id` varchar(40) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `desc` varchar(40) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '（0：预览；1：编辑；2：删除；3：打印；4：下载）',
  `dep_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_12` (`dep_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`dep_id`) REFERENCES `member_department` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_group
-- ----------------------------
INSERT INTO `group_group` VALUES ('06824199-003f-44bf-ad27-026b902242c8', '设备部下载文件分组', '这是设备部下载文件的分组', '0', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('0a15b066-5162-4498-8c51-68a5dea395a6', '销售部预览文件分组', '这是销售部预览文件的分组', '3', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('0b6c2406-2db9-4226-9d56-943f1993af1b', '财务部删除文件分组', '这是财务部删除文件的分组', '1', '3675ab36-1e73-4dd2-abe1-3298684357b2', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('0d71a589-bb72-423b-b559-ac83774e2e3d', '综合办预览文件分组', '这是综合办预览文件的分组', '3', '2316e667-69af-4510-bf8d-f8f15d29f74c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('0d7f4fe9-0245-419c-b802-4b25072b76b3', '总经办下载文件分组', '这是总经办下载文件的分组', '0', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('17e18aec-a415-47a9-b815-ff5f73c3a345', '物流部修改文件分组', '这是物流部修改文件的分组', '2', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('1e5fd3b9-502e-46ee-8360-eafe9ba1c1f1', '采购部修改文件分组', '这是采购部修改文件的分组', '2', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('203f8de0-485e-45a6-b15a-7fdb5d84f7f6', 'IT部下载文件分组', '这是IT部下载文件的分组', '0', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('223f443b-daa4-48d1-ac70-93a86060547f', '行政部修改文件分组', '这是行政部修改文件的分组', '2', '4be31a15-217c-4d93-a875-e62bdb41b9bc', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('2568ef8c-50db-4906-9897-830ec0132b67', '财务部修改文件分组', '这是财务部修改文件的分组', '2', '3675ab36-1e73-4dd2-abe1-3298684357b2', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('29909e66-84fa-46c2-afe0-d1e063692156', '设备部修改文件分组', '这是设备部修改文件的分组', '2', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('31532f4c-1127-4b9d-9d79-ea6bf40d590f', '设备部预览文件分组', '这是设备部预览文件的分组', '3', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('33dfaf43-f1a9-4e61-8623-e501001d616d', '生产部删除文件分组', '这是生产部删除文件的分组', '1', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('35567df3-357b-42be-97f1-30f1d9309d3e', 'IT部删除文件分组', '这是IT部删除文件的分组', '1', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('383d71ce-195b-4de5-a8cd-d711b4f86e63', '物流部下载文件分组', '这是物流部下载文件的分组', '0', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('39868c5d-7d07-48a9-b595-b77e8f92858d', '设计部预览文件分组', '这是设计部预览文件的分组', '3', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('3cebffe8-1be5-4255-aa27-7e647dadadee', '销售部删除文件分组', '这是销售部删除文件的分组', '1', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('49307d0a-bd1b-4e6d-a775-5afddb9d50ed', '成品仓下载文件分组', '这是成品仓下载文件的分组', '0', 'd01e2b06-d3c5-4547-a686-92947eddcc62', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('4e02c273-85e8-4cab-8d43-c8805c640a44', '物流部预览文件分组', '这是物流部预览文件的分组', '3', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('533414e5-9ca5-4379-881e-6e238b746f25', '综合办下载文件分组', '这是综合办下载文件的分组', '0', '2316e667-69af-4510-bf8d-f8f15d29f74c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('54a52c77-2476-4e4a-b7c0-5da85314fb7b', '生产部修改文件分组', '这是生产部修改文件的分组', '2', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('56a99261-fa32-44c8-95fd-e17f3d1db973', '采购部预览文件分组', '这是采购部预览文件的分组', '3', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('5dcd7f72-08ad-496c-8264-57338e0de839', '综合办删除文件分组', '这是综合办删除文件的分组', '1', '2316e667-69af-4510-bf8d-f8f15d29f74c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('6318cccc-08c4-4e19-ab5a-57f4aef37b77', '采购部删除文件分组', '这是采购部删除文件的分组', '1', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('66894593-f6dc-4fc1-9059-4d0068587e4f', '档案部下载文件分组', '这是档案部下载文件的分组', '0', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('6a944cb0-91e7-4489-bff3-c2ab0fa8c51a', '销售部下载文件分组', '这是销售部下载文件的分组', '0', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('6fedeac9-195f-49bd-a67e-b50684864977', '行政部预览文件分组', '这是行政部预览文件的分组', '3', '4be31a15-217c-4d93-a875-e62bdb41b9bc', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('7288ddc2-bc65-4a70-b547-56733a1abf1f', '总经办预览文件分组', '这是总经办预览文件的分组', '3', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('83ca7d8e-5f08-45cc-ac70-113007d58fe1', '物流部删除文件分组', '这是物流部删除文件的分组', '1', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('84b911f6-61ee-4311-92e5-272db992df19', '档案部预览文件分组', '这是档案部预览文件的分组', '3', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('8825fb5f-c164-400b-998a-2a40395b456d', '总经办删除文件分组', '这是总经办删除文件的分组', '1', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('88e83fea-db75-4dd0-910d-a0cb0e6d4b9c', '档案部删除文件分组', '这是档案部删除文件的分组', '1', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('91c4ce9e-c772-4f71-9652-49ac1d6c8f5a', '生产部下载文件分组', '这是生产部下载文件的分组', '0', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('9bb10d27-509b-4c10-9a79-e6a94cf42d70', '客服部预览文件分组', '这是客服部预览文件的分组', '3', '8229a4e1-8755-45f5-8fe7-0989d961ef63', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('9c1880bd-311f-4b94-b3d3-539446bb947b', '设计部删除文件分组', '这是设计部删除文件的分组', '1', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('a235804a-c90d-46d7-aab5-2048dadbde2b', '行政部删除文件分组', '这是行政部删除文件的分组', '1', '4be31a15-217c-4d93-a875-e62bdb41b9bc', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('a41b597f-771a-459b-977a-332d89249802', '设计部修改文件分组', '这是设计部修改文件的分组', '2', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('a565844f-c788-4741-bd87-d371642c707b', '财务部下载文件分组', '这是财务部下载文件的分组', '0', '3675ab36-1e73-4dd2-abe1-3298684357b2', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('a7a6c062-51b6-4b11-86b5-44d868b987e5', '综合办修改文件分组', '这是综合办修改文件的分组', '2', '2316e667-69af-4510-bf8d-f8f15d29f74c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('af9a0c00-4d88-4923-bd11-fa18df07562c', '成品仓预览文件分组', '这是成品仓预览文件的分组', '3', 'd01e2b06-d3c5-4547-a686-92947eddcc62', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('b489c0a8-f39b-4a18-8ceb-4631e16e5ed0', '技术部删除文件分组', '这是技术部删除文件的分组', '1', '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('b96f94bd-cfb0-41ea-b9d6-4eac3e180ff4', '客服部修改文件分组', '这是客服部修改文件的分组', '2', '8229a4e1-8755-45f5-8fe7-0989d961ef63', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('be3f68ad-630c-4cfe-bc50-be0195c4eefd', 'IT部预览文件分组', '这是IT部预览文件的分组', '3', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('bfc2c891-a69d-4491-a34b-1e69d10dd0a8', '总经办修改文件分组', '这是总经办修改文件的分组', '2', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('c913c4d0-4fe8-40d3-88f8-55746d58e426', '成品仓修改文件分组', '这是成品仓修改文件的分组', '2', 'd01e2b06-d3c5-4547-a686-92947eddcc62', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('c936c0eb-8fd4-4607-a914-f2146e86b885', '技术部预览文件分组', '这是技术部预览文件的分组', '3', '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('ca28b0d7-b98e-46c2-b027-7b92646190ad', '档案部修改文件分组', '这是档案部修改文件的分组', '2', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('cb5fa9cd-3afd-4272-afa5-3dcef768eff7', 'IT部修改文件分组', '这是IT部修改文件的分组', '2', '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('cc12ede4-ab57-4212-a514-51deec93caeb', '技术部下载文件分组', '这是技术部下载文件的分组', '0', '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('ce85fa8b-112a-42fb-950e-4c598d051905', '销售部修改文件分组', '这是销售部修改文件的分组', '2', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('d33afb6a-0780-412b-84de-f993c42d2d74', '成品仓删除文件分组', '这是成品仓删除文件的分组', '1', 'd01e2b06-d3c5-4547-a686-92947eddcc62', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('dc4b48fd-7733-4fb2-b534-448f8e57fb74', '生产部预览文件分组', '这是生产部预览文件的分组', '3', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('e43f30d2-64cb-4926-994b-e4c3a03d8cef', '客服部删除文件分组', '这是客服部删除文件的分组', '1', '8229a4e1-8755-45f5-8fe7-0989d961ef63', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('e70c33f7-759e-4961-8497-f78c8719c731', '设备部删除文件分组', '这是设备部删除文件的分组', '1', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('e77dadd4-0953-4807-a8b7-a6e7cb4567f2', '技术部修改文件分组', '这是技术部修改文件的分组', '2', '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('e8856fa9-0c95-4ebe-8b75-806e7d5e4d93', '财务部预览文件分组', '这是财务部预览文件的分组', '3', '3675ab36-1e73-4dd2-abe1-3298684357b2', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('f4e37cc7-cc2a-4a11-bd21-33f79cd0c0d9', '采购部下载文件分组', '这是采购部下载文件的分组', '0', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('f5020b7f-1181-487e-808d-42096b19d794', '设计部下载文件分组', '这是设计部下载文件的分组', '0', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('f7577830-42f6-4874-a64f-30b965c72497', '行政部下载文件分组', '这是行政部下载文件的分组', '0', '4be31a15-217c-4d93-a875-e62bdb41b9bc', '2019-06-03 22:53:16', '2019-06-03 22:53:16');
INSERT INTO `group_group` VALUES ('fecf592a-9eb7-474d-ab71-87f43c84ba1a', '客服部下载文件分组', '这是客服部下载文件的分组', '0', '8229a4e1-8755-45f5-8fe7-0989d961ef63', '2019-06-03 22:53:16', '2019-06-03 22:53:16');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` varchar(40) NOT NULL,
  `operator` varchar(40) DEFAULT NULL COMMENT '姓名+账号',
  `operate` varchar(40) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `success` bit(1) DEFAULT NULL,
  `error_msg` varchar(200) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of monitor
-- ----------------------------

-- ----------------------------
-- Table structure for `log_2019_06`
-- ----------------------------
DROP TABLE IF EXISTS `log_2019_06`;
CREATE TABLE `log_2019_06` (
  `id` varchar(40) NOT NULL,
  `operator` varchar(40) DEFAULT NULL COMMENT '姓名+账号',
  `operate` varchar(40) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `success` bit(1) DEFAULT NULL,
  `error_msg` varchar(200) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_2019_06
-- ----------------------------

-- ----------------------------
-- Table structure for `log_2019_07`
-- ----------------------------
DROP TABLE IF EXISTS `log_2019_07`;
CREATE TABLE `log_2019_07` (
  `id` varchar(40) NOT NULL,
  `operator` varchar(40) DEFAULT NULL COMMENT '姓名+账号',
  `operate` varchar(40) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `success` bit(1) DEFAULT NULL,
  `error_msg` varchar(200) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_2019_07
-- ----------------------------

-- ----------------------------
-- Table structure for `log_2019_08`
-- ----------------------------
DROP TABLE IF EXISTS `log_2019_08`;
CREATE TABLE `log_2019_08` (
  `id` varchar(40) NOT NULL,
  `operator` varchar(40) DEFAULT NULL COMMENT '姓名+账号',
  `operate` varchar(40) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `success` bit(1) DEFAULT NULL,
  `error_msg` varchar(200) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_2019_08
-- ----------------------------

-- ----------------------------
-- Table structure for `member_department`
-- ----------------------------
DROP TABLE IF EXISTS `member_department`;
CREATE TABLE `member_department` (
  `id` varchar(40) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_department
-- ----------------------------
INSERT INTO `member_department` VALUES ('07357263-c419-4662-b951-8940bcbe2ab3', 'IT部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('14600de5-6ff3-4235-b00b-3c7a46a1666d', '总经办', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('2316e667-69af-4510-bf8d-f8f15d29f74c', '综合办', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('2ca9b52a-17d6-43c7-889b-ccb457b3657d', '物流部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('3675ab36-1e73-4dd2-abe1-3298684357b2', '财务部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '采购部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('4be31a15-217c-4d93-a875-e62bdb41b9bc', '行政部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('8229a4e1-8755-45f5-8fe7-0989d961ef63', '客服部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '技术部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('bf9ec363-e71c-48d7-bc1a-322e8825b82c', '设备部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('c1f4b22e-f0db-449e-96ea-a9b0819a284a', '档案部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('d01e2b06-d3c5-4547-a686-92947eddcc62', '成品仓', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('d4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '生产部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('f1f84939-a8fb-4937-836a-bfe3bc11dae0', '设计部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');
INSERT INTO `member_department` VALUES ('fb6c08e2-9b68-4323-98b3-b7713880fd03', '销售部', '2019-06-03 22:53:45', '2019-06-03 22:53:46');

-- ----------------------------
-- Table structure for `member_employee`
-- ----------------------------
DROP TABLE IF EXISTS `member_employee`;
CREATE TABLE `member_employee` (
  `id` varchar(40) NOT NULL,
  `account` varchar(16) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `telnum` varchar(11) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `dep_id` varchar(40) DEFAULT NULL,
  `pos_id` varchar(40) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_EMP_DEP` (`dep_id`),
  KEY `FK_EMP_POS` (`pos_id`),
  CONSTRAINT `FK_EMP_DEP` FOREIGN KEY (`dep_id`) REFERENCES `member_department` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EMP_POS` FOREIGN KEY (`pos_id`) REFERENCES `member_position` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_employee
-- ----------------------------
INSERT INTO `member_employee` VALUES ('086930a9-e998-4148-9d68-1e246bc76f24', null, '张三_综合', null, null, null, null, null, null, null, '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('0b86fe75-fc6a-49c5-98ff-b8504d27aef6', null, '王二_技术', null, null, null, null, null, null, null, '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('151052e3-87ae-4f73-b537-2ffbb5bc3ee7', 'maziitb', '麻子_IT部', '男', '12345678917', '2018-02-01', 'B57E867DDBD284F10F8B76CDE58F9A85', '07357263-c419-4662-b951-8940bcbe2ab3', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('184f874a-f917-493f-a270-41b74180c87b', 'maziwlb', '麻子_物流部', '男', '12345678929', '2018-02-01', '253BFC90226F12C79DD2AEFAAB44BCA0', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('1bd7274cd0ee483f8bbe86c4eda707c9', 'zhaoyang', '赵洋', '男', '13634148058', '2018-03-06', 'ABED43B10BFF8C28A3EB7E6BFFB55116', '07357263-c419-4662-b951-8940bcbe2ab3', 'd8f5b576-f7ce-4aa2-8fc8-101b955e2406', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('1da201d0-9cd0-43f7-9f10-40c9676de871', 'lisicpc', '李四_成品仓', '女', '12345678955', '2018-02-01', '16BCBA3101A1E306EE666C3EF52A3751', 'd01e2b06-d3c5-4547-a686-92947eddcc62', '99266788-cd9d-4ad8-9989-b421c3b9ada0', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('27c6858d-0939-4495-a478-38ff0ec273cf', 'zhangsanscb', '张三_生产部', '男', '12345678958', '2018-02-01', 'C01F3DD4DE5ECC0A2BC48F2B21D17A15', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', 'f4c60387-8000-4357-89fd-f9189219b71c', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('2a71085a-de13-4e16-8608-72a5f41e9d69', 'wangerscb', '王二_生产部', '男', '12345678960', '2018-02-01', '1A6582D1938A4599D091E6E62F934C80', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('2dcd3590-2b6b-46dc-bba6-6c8d94b1c829', 'zhangsandab', '张三_档案部', '男', '12345678950', '2018-02-01', '6F5C556F37643CB73F9584E3A84197D8', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '779e9c14-207f-4513-832b-a204f437ed40', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('2f7864b4-e899-40aa-a30f-800188a2388a', 'wangerzhb', '王二_综合办', '男', '12345678924', '2018-02-01', '5BA90D696BECAEB7D4A7F97CDB509654', '2316e667-69af-4510-bf8d-f8f15d29f74c', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('38e06cb0-b199-4d2e-b3fc-3e31c42e2886', 'mazisbb', '麻子_设备部', '男', '12345678949', '2018-02-01', '3CD8837B69FB5294BB0C751071E2EE81', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('3b06e038-014d-4d27-b289-c428e93370d0', 'zhangsancwb', '张三_财务部', '男', '12345678930', '2018-02-01', '8AC1EF4406E7C33DC3F51838ADA1EE7A', '3675ab36-1e73-4dd2-abe1-3298684357b2', 'bb6293ba-c4af-4eba-9e48-54109496d4d2', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('3cc7f421-ceae-459f-b724-5a1abcecd791', 'mazixsb', '麻子_销售部', '男', '12345678969', '2018-02-01', '0A7509D6B34C966F0CFE01CBF2D5B5FB', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('4052ac9e-76a2-4e29-8977-ef7fbc9e226d', 'zhangsanzjb', '张三_总经办', '男', '12345678918', '2018-02-01', '6B4663CB9A00D4E0CB5600BCE59BC0AD', '14600de5-6ff3-4235-b00b-3c7a46a1666d', '93348a49-2cbd-49e8-b705-aa634b9b763d', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('4491db6d-5cb2-41d5-87cf-35213384bee2', 'zhangsanitb', '张三_IT部', '男', '12345678914', '2018-02-01', '9735A59F1845A56B8E94AE4999487F41', '07357263-c419-4662-b951-8940bcbe2ab3', '520169c2-fa83-4eef-8025-21a4b2e0304a', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('4ddf936e-d172-4ecc-81e5-56d584e9cd35', 'lisicgb', '李四_采购部', '女', '12345678935', '2018-02-01', '1EAB33F7DADB041B9E42E64EEA544B8D', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '0bbc5350-5f18-4163-8ea9-7a5a37291976', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('4dfc61cd-bbfe-4256-a965-ba4cbda6a02a', 'wangersbb', '王二_设备部', '男', '12345678948', '2018-02-01', '8D170683F47D3223B49B64B8A8935ADE', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('4eec607d-025f-4a4f-bd01-ba936e2aeeec', 'wangerkfb', '王二_客服部', '男', '12345678940', '2018-02-01', '744EC7E77E94611D14EF757403E0CEF3', '8229a4e1-8755-45f5-8fe7-0989d961ef63', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('50549d35-ba20-46bf-bd2f-1d929f7b23c8', 'lisixzb', '李四_行政部', '女', '12345678971', '2018-02-01', '409524542247FA11F52A1CB7323EE664', '4be31a15-217c-4d93-a875-e62bdb41b9bc', '8aebe6e0-6822-488f-9815-4d076dc304bc', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('53ac4489-5e49-4b42-9712-d3961dd6ddd5', 'wangerzjb', '王二_总经办', '男', '12345678920', '2018-02-01', '1B8F970D20C6734A107F9D40BD4F8617', '14600de5-6ff3-4235-b00b-3c7a46a1666d', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('5e7601cc-e07f-48cb-a8c1-6eae1689ba6a', 'mazijsb', '麻子_技术部', '男', '12345678945', '2018-02-01', '303C076AC633EFBD8DE6DBDDA3534999', '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('63bbc749-f751-44e7-b6f9-7f9f4ff0d974', 'wangercwb', '王二_财务部', '男', '12345678932', '2018-02-01', 'A0CC6956098EA51163C85F444EE6A9A4', '3675ab36-1e73-4dd2-abe1-3298684357b2', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('746d5c71-1b3a-4cb5-a1f6-a879253982f4', 'lisizjl', '李四_总经理', '女', '12345678913', '2018-02-01', '5D5EC07710B5B7227602672D3A16B09D', null, 'f51ade35-644c-43a6-a22c-d414abf036d9', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('77ee2202-6e0c-42e9-bfcb-c65d94df98c4', 'lisisjb', '李四_设计部', '女', '12345678963', '2018-02-01', '62D33508E5CED9E74601E60D932873E4', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', '08f84e20-dbbe-4183-935e-816e78c9ab76', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('7a546f25-ad23-4ba8-897a-aa623b1d9fcb', 'wangerxzb', '王二_行政部', '男', '12345678972', '2018-02-01', 'A5BCC23F5D5605F7F402CB3D9005FF08', '4be31a15-217c-4d93-a875-e62bdb41b9bc', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('8030580e-f037-4721-8868-67fe5dec4130', 'mazizhb', '麻子_综合办', '男', '12345678925', '2018-02-01', '465EEC801BB7E897843AB749E134AABC', '2316e667-69af-4510-bf8d-f8f15d29f74c', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('8036f464-5751-49a0-aa45-c3c1f1d558ec', 'zhangsandsz', '张三_董事长', '男', '12345678911', '2018-02-01', '6B2103BEAD9D4E6C973DE0588A580F2A', null, '41d14255-ad38-4e13-aa7c-c9acc6d5eddd', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('8160fcda-9b6d-4682-805f-6a7705888145', 'mazicgb', '麻子_采购部', '男', '12345678937', '2018-02-01', '1C14A6DF2A7EF82430F5B643EB2BF844', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('833a96a4-7344-404c-a172-51dfa87e571b', 'lisiscb', '李四_生产部', '女', '12345678959', '2018-02-01', '3328ECAE6516013F7415FEBE915230EF', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '0d60f54b-754f-4c66-b910-80298870b2ee', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('87e05ed0-36c7-4a6d-8026-dca55047582b', 'zhangsanjsb', '张三_技术部', '男', '12345678942', '2018-02-01', '839CD60F0246ED82F1672583C6D16DEC', '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '248046ce-e541-4c98-9fbf-ee72f8dce2e3', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('896723f7-f8ff-44d8-abc2-00aa3a749676', 'wangercpc', '王二_成品仓', '男', '12345678956', '2018-02-01', '765C2D898C0455B01B76EB7FDDBBBBB8', 'd01e2b06-d3c5-4547-a686-92947eddcc62', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('8a1ea5bb-7ab4-4b4e-a3cb-f7cdf0dbac3c', 'mazisjb', '麻子_设计部', '男', '12345678965', '2018-02-01', '644F3B4CD204DC8410A6CFDC5125116D', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('8ed67bad-1aa9-4943-bf16-8f2b09760f92', 'lisikfb', '李四_客服部', '女', '12345678939', '2018-02-01', 'E3EA887C35B4076D220C32B5DAACD1E4', '8229a4e1-8755-45f5-8fe7-0989d961ef63', 'd6a1d451-00c5-4470-b65d-64c543ad982f', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('959843e7-94e3-45ae-865b-b60b1d80f384', 'wangerxsb', '王二_销售部', '男', '12345678968', '2018-02-01', 'EBC43C31F5E2AF823DE3DC2B166D1BE7', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('98527aba-fdb5-4b96-af8f-0b6e24a6e765', 'wangerwlb', '王二_物流部', '男', '12345678928', '2018-02-01', '4F13059E0BF89AAE3ECFDCF1179D56F5', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('9b94c4ec8b7d47a28204629b6fa9f073', 'xiaoming', '小明', '男', '12345678974', '2018-03-12', '48E231E66FF8943DB0F6D2B6CB6536D2', null, null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('a19f881e-c79b-472b-87f4-b8434eab107b', 'lisiitb', '李四_IT部', '女', '12345678915', '2018-02-01', '8905D203DF07596682C40F932E0A54E9', '07357263-c419-4662-b951-8940bcbe2ab3', 'd8f5b576-f7ce-4aa2-8fc8-101b955e2406', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('a1e22b32-6dd8-45a0-a4d0-1cf810cc787a', 'lisizhb', '李四_综合办', '女', '12345678923', '2018-02-01', '63A7B6777B49A3B3FCAB4B1AB3265585', '2316e667-69af-4510-bf8d-f8f15d29f74c', 'd8482549-95f7-496e-96f3-5c48303c5234', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('a3a3acda-9ebb-4fd5-bf2a-886873c9c696', 'mazidab', '麻子_档案部', '男', '12345678953', '2018-02-01', 'D5A11E482840E46978E0F3BDA521FF6E', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('b12fe781-d7b1-4c23-8f8a-c89e4fae31e4', 'lisixsb', '李四_销售部', '女', '12345678967', '2018-02-01', '5AFE83834008F67156ECF09620BE8B74', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', 'f2df9cab-8f0e-4c04-bd15-ab953d4a6d6b', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('b31c944a-86da-429b-a2f7-0d077be4759a', 'zhangsansjb', '张三_设计部', '男', '12345678962', '2018-02-01', 'E673B01AA81473B45A4CF474CA356540', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', 'd1b19ee5-e788-4d0a-942c-8ec7168719ab', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('b3422802-6d79-4247-b49a-836d43c75ee6', 'lisisbb', '李四_设备部', '女', '12345678947', '2018-02-01', '1ECA2CDACC960C8C60AC71E59468220B', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', 'b0ac630f-b45a-434b-9a53-d6e3afa463d2', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('b6300ba2-8783-43ac-904a-d25699d8ec2f', 'wangerdab', '王二_档案部', '男', '12345678952', '2018-02-01', 'EBE0BF62B7AA4E69A2BA64815DE44E1F', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('bb85ea57-e365-4b35-8f0c-541d5b5a21a3', 'wangersjb', '王二_设计部', '男', '12345678964', '2018-02-01', '42B2AD3A0019A2BD8BF8509A1B704D34', 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('bc0c15e2-1aa7-4ed0-a28f-0aa9259aeead', 'lisijsb', '李四_技术部', '女', '12345678943', '2018-02-01', 'F8F2B47C5337DFC4BBB841B1BAC97086', '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', 'c0300600-8326-4835-8639-89d23241a5af', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('bfdd0550-64b8-4097-b56b-c4abef363ff6', 'zhangsanxzb', '张三_行政部', '男', '12345678970', '2018-02-01', 'DB5CDE352C2287E0AF2B919AB0EDA909', '4be31a15-217c-4d93-a875-e62bdb41b9bc', '3846092c-a546-40b2-b016-327ae26ad693', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('c3bd2269-1d41-4fab-b3d9-2f360ec89090', 'mazicwb', '麻子_财务部', '男', '12345678933', '2018-02-01', 'B6FDB4F57C67EFE3037718FFDDB5BFB2', '3675ab36-1e73-4dd2-abe1-3298684357b2', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('c3bdfce1-ef11-4a11-82b2-ef02412753b0', 'mazikfb', '麻子_客服部', '男', '12345678941', '2018-02-01', 'A766DD47BA1086EC6AF2A928FF897881', '8229a4e1-8755-45f5-8fe7-0989d961ef63', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('ca870619-699d-462f-8f50-1fd37bc76def', 'lisiwlb', '李四_物流部', '女', '12345678927', '2018-02-01', '89324B3F4104EF1B247BEC0FC7B76767', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', 'b4990cca-5f7c-4109-9736-cba780793ee7', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('ce2172ab-4e87-418e-b349-b5b5e627b2dd', 'lisizjb', '李四_总经办', '女', '12345678919', '2018-02-01', 'E9C31B6DF7FC62DF1644624169E25A30', '14600de5-6ff3-4235-b00b-3c7a46a1666d', 'cfd160f5-59a8-4aa1-9551-c72665591a9e', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('cea9d5e7-cd74-4048-991f-e2e4122bcc7e', 'zhangsanzjl', '张三_总经理', '男', '12345678912', '2018-02-01', '110410D1F7A602C00CAD0384DAB66C11', null, 'f51ade35-644c-43a6-a22c-d414abf036d9', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('dc7faf39-862d-4229-99ee-a66a07e9e4ee', 'zhangsansbb', '张三_设备部', '男', '12345678946', '2018-02-01', 'CBC6CD12A20A52BE108B1AB3BACD010C', 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', '5a30e8d8-0842-4c42-b236-268cd04fb956', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('defa9750-0781-44b7-8f86-cd864b2af1b3', 'mazicpc', '麻子_成品仓', '男', '12345678957', '2018-02-01', 'D26EDFE8129F62057DEBA0EA98675CAA', 'd01e2b06-d3c5-4547-a686-92947eddcc62', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('df175af0-8624-4a1e-8f33-c28ca16ae32e', 'mazizjb', '麻子_总经办', '男', '12345678921', '2018-02-01', 'E0F910BB08EBF4E206C8DEA63DD27C04', '14600de5-6ff3-4235-b00b-3c7a46a1666d', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('e12178ae-d5ac-4e52-871d-4ddd08c72dc4', 'wangercgb', '王二_采购部', '男', '12345678936', '2018-02-01', '60B82BC1652042ADABAE2AF872BC2731', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('e242496a-4cad-4678-9771-f052f145352e', 'lisidab', '李四_档案部', '女', '12345678951', '2018-02-01', 'B381C46CDFC68A22F5B6B1BFE3EA1BFB', 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '91861c9f-bed4-4a69-93bb-06c7177033e7', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('e451c415-cd74-48a1-95e0-29e0bd0e4a14', 'mazixzb', '麻子_行政部', '男', '12345678973', '2018-02-01', 'C64C14FEFE82C0C7E91BE16F1F3DBF5E', '4be31a15-217c-4d93-a875-e62bdb41b9bc', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('e898e6a0-6c08-4581-80dd-2fcfe56547db', 'zhangsankfb', '张三_客服部', '男', '12345678938', '2018-02-01', 'DE19090125B7ACE95731A0A74F0F48DA', '8229a4e1-8755-45f5-8fe7-0989d961ef63', 'bae08321-5c55-4182-9222-af219cc0f6ef', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('e8ac81b1-7644-44df-9a01-69fe727bdcde', 'zhangsancpc', '张三_成品仓', '男', '12345678954', '2018-02-01', '69F33BAE495556D58679B743A502D781', 'd01e2b06-d3c5-4547-a686-92947eddcc62', 'c0474dca-8a6d-4e28-918d-dcc5cd1fab3e', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('e931dbaf-2d50-4193-bbfa-319810538d82', 'zhangsancgb', '张三_采购部', '男', '12345678934', '2018-02-01', '4D8E693CA423E60CF28881964A2FB692', '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', 'ec371e80-7591-4d89-9833-39f915386147', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('f14b0001-b6c0-4737-83ff-17fdefefa9a5', 'zhangsanwlb', '张三_物流部', '男', '12345678926', '2018-02-01', '930F2AD96CAC9600A05BE9534420644E', '2ca9b52a-17d6-43c7-889b-ccb457b3657d', '4c4df412-4163-4e8c-a3cd-e3dd71aa07af', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('f1be288e-5ed5-4298-8f67-06bf559ec04d', 'maziscb', '麻子_生产部', '男', '12345678961', '2018-02-01', '7B6D2ABB810042E636B2C3760F34AFFD', 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('fa49b46f-828b-4564-931c-6d2427b29307', 'lisicwb', '李四_财务部', '女', '12345678931', '2018-02-01', '4BDFEC4428534081B6347F200E51F094', '3675ab36-1e73-4dd2-abe1-3298684357b2', '8d04d7dd-4d1b-42bd-88b0-921eb18ec125', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('fd0c43d4-28bc-45d1-8740-aa9b120b64b9', 'wangeritb', '王二_IT部', '男', '12345678916', '2018-02-01', 'D2D817693AC796446D39B10ADBA7446F', '07357263-c419-4662-b951-8940bcbe2ab3', null, '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');
INSERT INTO `member_employee` VALUES ('ffb87d86-f196-4849-8efd-f9e9a85121f1', 'zhangsanxsb', '张三_销售部', '男', '12345678966', '2018-02-01', 'B8BAB7AF779C00B32FADCFB3F519E05D', 'fb6c08e2-9b68-4323-98b3-b7713880fd03', '69f46a0f-22ba-465e-82fb-b9a7c2b2355e', '', '2019-06-03 22:54:07', '2019-06-03 22:54:08');

-- ----------------------------
-- Table structure for `member_emp_role`
-- ----------------------------
DROP TABLE IF EXISTS `member_emp_role`;
CREATE TABLE `member_emp_role` (
  `emp_id` varchar(40) DEFAULT NULL,
  `role_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_EMPLOYEE` (`emp_id`),
  KEY `FK_ROLE` (`role_id`),
  CONSTRAINT `FK_EMPLOYEE` FOREIGN KEY (`emp_id`) REFERENCES `member_employee` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_emp_role
-- ----------------------------
INSERT INTO `member_emp_role` VALUES ('4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '4c58c313-3bbc-4917-8db0-9619ff45c25b', '2019-06-03 22:53:57', '2019-06-03 22:53:58');
INSERT INTO `member_emp_role` VALUES ('1bd7274cd0ee483f8bbe86c4eda707c9', '4c58c313-3bbc-4917-8db0-9619ff45c25b', '2019-06-03 22:53:57', '2019-06-03 22:53:58');
INSERT INTO `member_emp_role` VALUES ('ce2172ab-4e87-418e-b349-b5b5e627b2dd', '1be92a7d98c14f8794af923bba315759', '2019-06-03 22:53:57', '2019-06-03 22:53:58');
INSERT INTO `member_emp_role` VALUES ('ce2172ab-4e87-418e-b349-b5b5e627b2dd', 'e6c7569273684f93ab5c060e4391747b', '2019-06-03 22:53:57', '2019-06-03 22:53:58');

-- ----------------------------
-- Table structure for `member_position`
-- ----------------------------
DROP TABLE IF EXISTS `member_position`;
CREATE TABLE `member_position` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `dep_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_POS_DEP_ID_` (`dep_id`),
  CONSTRAINT `FK_POS_DEP_ID_` FOREIGN KEY (`dep_id`) REFERENCES `member_department` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_position
-- ----------------------------
INSERT INTO `member_position` VALUES ('08f84e20-dbbe-4183-935e-816e78c9ab76', '设计部经理', null, 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('0bbc5350-5f18-4163-8ea9-7a5a37291976', '采购部经理', null, '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('0d60f54b-754f-4c66-b910-80298870b2ee', '生产部经理', null, 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('248046ce-e541-4c98-9fbf-ee72f8dce2e3', '技术部总监', null, '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('3846092c-a546-40b2-b016-327ae26ad693', '行政部总监', null, '4be31a15-217c-4d93-a875-e62bdb41b9bc', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('41d14255-ad38-4e13-aa7c-c9acc6d5eddd', '董事长', null, null, '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('4c4df412-4163-4e8c-a3cd-e3dd71aa07af', '物流部总监', null, '2ca9b52a-17d6-43c7-889b-ccb457b3657d', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('520169c2-fa83-4eef-8025-21a4b2e0304a', 'IT部总监', null, '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('5a30e8d8-0842-4c42-b236-268cd04fb956', '设备部总监', null, 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('69f46a0f-22ba-465e-82fb-b9a7c2b2355e', '销售部总监', null, 'fb6c08e2-9b68-4323-98b3-b7713880fd03', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('779e9c14-207f-4513-832b-a204f437ed40', '档案部总监', null, 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('8aebe6e0-6822-488f-9815-4d076dc304bc', '行政部经理', null, '4be31a15-217c-4d93-a875-e62bdb41b9bc', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('8d04d7dd-4d1b-42bd-88b0-921eb18ec125', '财务部经理', null, '3675ab36-1e73-4dd2-abe1-3298684357b2', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('91861c9f-bed4-4a69-93bb-06c7177033e7', '档案部经理', null, 'c1f4b22e-f0db-449e-96ea-a9b0819a284a', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('93348a49-2cbd-49e8-b705-aa634b9b763d', '总经办总监', null, '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('99266788-cd9d-4ad8-9989-b421c3b9ada0', '成品仓经理', null, 'd01e2b06-d3c5-4547-a686-92947eddcc62', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('b0ac630f-b45a-434b-9a53-d6e3afa463d2', '设备部经理', null, 'bf9ec363-e71c-48d7-bc1a-322e8825b82c', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('b4990cca-5f7c-4109-9736-cba780793ee7', '物流部经理', null, '2ca9b52a-17d6-43c7-889b-ccb457b3657d', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('bae08321-5c55-4182-9222-af219cc0f6ef', '客服部总监', null, '8229a4e1-8755-45f5-8fe7-0989d961ef63', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('bb6293ba-c4af-4eba-9e48-54109496d4d2', '财务部总监', null, '3675ab36-1e73-4dd2-abe1-3298684357b2', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('c0300600-8326-4835-8639-89d23241a5af', '技术部经理', null, '8ef197ea-6d30-4d21-9acd-ea8db3a2c8f5', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('c0474dca-8a6d-4e28-918d-dcc5cd1fab3e', '成品仓总监', null, 'd01e2b06-d3c5-4547-a686-92947eddcc62', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('c449ddc0-ba93-4db3-af02-93b577c8a2e2', '综合办总监', null, '2316e667-69af-4510-bf8d-f8f15d29f74c', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('cfd160f5-59a8-4aa1-9551-c72665591a9e', '总经办经理', null, '14600de5-6ff3-4235-b00b-3c7a46a1666d', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('d1b19ee5-e788-4d0a-942c-8ec7168719ab', '设计部总监', null, 'f1f84939-a8fb-4937-836a-bfe3bc11dae0', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('d6a1d451-00c5-4470-b65d-64c543ad982f', '客服部经理', null, '8229a4e1-8755-45f5-8fe7-0989d961ef63', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('d8482549-95f7-496e-96f3-5c48303c5234', '综合办经理', null, '2316e667-69af-4510-bf8d-f8f15d29f74c', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('d8f5b576-f7ce-4aa2-8fc8-101b955e2406', 'IT部经理', null, '07357263-c419-4662-b951-8940bcbe2ab3', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('ec371e80-7591-4d89-9833-39f915386147', '采购部总监', null, '36a49c53-8bd4-48bc-9f69-ba6a09b44fee', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('f2df9cab-8f0e-4c04-bd15-ab953d4a6d6b', '销售部经理', null, 'fb6c08e2-9b68-4323-98b3-b7713880fd03', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('f4c60387-8000-4357-89fd-f9189219b71c', '生产部总监', null, 'd4c6fdc1-a38f-4577-8cb6-c0e85d163e22', '2019-06-03 22:54:19', '2019-06-03 22:54:19');
INSERT INTO `member_position` VALUES ('f51ade35-644c-43a6-a22c-d414abf036d9', '总经理', null, null, '2019-06-03 22:54:19', '2019-06-03 22:54:19');

-- ----------------------------
-- Table structure for `procedure`
-- ----------------------------
DROP TABLE IF EXISTS `procedure`;
CREATE TABLE `procedure` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `form_id` varchar(40) DEFAULT NULL,
  `type_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_form_id` (`form_id`),
  KEY `FK_type_id` (`type_id`),
  CONSTRAINT `FK_form_id` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`),
  CONSTRAINT `FK_type_id` FOREIGN KEY (`type_id`) REFERENCES `procedure_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procedure
-- ----------------------------
INSERT INTO `procedure` VALUES ('24555f7b3a364fb693e146952df67f5a', '招聘申请流程', '{\'nodes\':{\'node_1\':{\'name\':\'发起流程\',\'left\':87,\'top\':112,\'type\':\'start round\',\'width\':24,\'height\':24,\'alt\':true},\'node_2\':{\'name\':\'申请部门意见\',\'left\':196,\'top\':95,\'type\':\'chat\',\'width\':150,\'height\':50,\'alt\':true},\'node_3\':{\'name\':\'人事行政意见\',\'left\':428,\'top\':93,\'type\':\'chat\',\'width\':150,\'height\':50,\'alt\':true},\'node_4\':{\'name\':\'直接上级意见\',\'left\':684,\'top\':93,\'type\':\'chat\',\'width\':148,\'height\':48,\'alt\':true},\'node_5\':{\'name\':\'总经理审批\',\'left\':963,\'top\':31,\'type\':\'end round\',\'width\':24,\'height\':24,\'alt\':true},\'node_6\':{\'name\':\'董事长审批\',\'left\':970,\'top\':180,\'type\':\'end round\',\'width\':24,\'height\':24,\'alt\':true}},\'lines\':{\'line_7\':{\'type\':\'sl\',\'from\':\'node_1\',\'to\':\'node_2\',\'name\':\'\'},\'line_8\':{\'type\':\'sl\',\'from\':\'node_2\',\'to\':\'node_3\',\'name\':\'\'},\'line_9\':{\'type\':\'sl\',\'from\':\'node_3\',\'to\':\'node_4\',\'name\':\'\'},\'line_10\':{\'type\':\'sl\',\'from\':\'node_4\',\'to\':\'node_5\',\'name\':\'\'},\'line_11\':{\'type\':\'sl\',\'from\':\'node_4\',\'to\':\'node_6\',\'name\':\'\'}},\'initNum\':1}', '66297dfc-8de4-4ee5-b10a-8f96405b45f2', '9bcd6f49-5d7d-48c2-9e91-dbe9bd5ba30f', '2019-06-03 22:54:38', '2019-06-03 22:54:39');

-- ----------------------------
-- Table structure for `procedure_affair`
-- ----------------------------
DROP TABLE IF EXISTS `procedure_affair`;
CREATE TABLE `procedure_affair` (
  `id` varchar(40) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `sponsor_id` varchar(40) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `proc_id` varchar(40) DEFAULT NULL,
  `form_id` varchar(40) DEFAULT NULL,
  `node_id` varchar(40) DEFAULT NULL,
  `handler_id` varchar(40) DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_INSTANCE_PROCEDURE_ID` (`proc_id`),
  KEY `FK_INSTANCE_SPONSOR_ID` (`sponsor_id`),
  KEY `FK_INSTANCE_CURRENT_NODE` (`node_id`),
  KEY `FK_INSTANCE_FORM_ID` (`form_id`),
  CONSTRAINT `FK_INSTANCE_CURRENT_NODE` FOREIGN KEY (`node_id`) REFERENCES `procedure_node` (`id`),
  CONSTRAINT `FK_INSTANCE_FORM_ID` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`),
  CONSTRAINT `FK_INSTANCE_PROCEDURE_ID` FOREIGN KEY (`proc_id`) REFERENCES `procedure` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_SPONSOR_ID` FOREIGN KEY (`sponsor_id`) REFERENCES `member_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procedure_affair
-- ----------------------------
INSERT INTO `procedure_affair` VALUES ('116571bf58534894a0348aca58bea92d', '招聘申请1(2018-03-05 18:17:34:张三_总经办)', '4052ac9e-76a2-4e29-8977-ef7fbc9e226d', '总经理说工资加1k', '24555f7b3a364fb693e146952df67f5a', '66297dfc-8de4-4ee5-b10a-8f96405b45f2', '03caf965236c49d2b62c1c07da873798', '', '2', '2018-03-05 18:17:34', '2019-06-03 22:55:22');
INSERT INTO `procedure_affair` VALUES ('1b208e118c474464bb02a0b6516dcade', '招聘申请（附件）(2018-03-07 15:54:53:张三_档案部)', '2dcd3590-2b6b-46dc-bba6-6c8d94b1c829', '', '24555f7b3a364fb693e146952df67f5a', '66297dfc-8de4-4ee5-b10a-8f96405b45f2', '7a9f86426daf4e25bfa2d20f75473a30', 'zhangsankfb', '0', '2018-03-07 15:54:54', '2019-06-03 22:55:22');
INSERT INTO `procedure_affair` VALUES ('bbd47dfd438341db85c1a6223cca068c', '招聘申请3(2018-03-07 12:10:39:李四_总经办)', 'ce2172ab-4e87-418e-b349-b5b5e627b2dd', '工资加1K', '24555f7b3a364fb693e146952df67f5a', '66297dfc-8de4-4ee5-b10a-8f96405b45f2', 'b56d558bc1be48c08f2bb32e7fade1a7', '', '1', '2018-03-07 12:10:39', '2019-06-03 22:55:22');
INSERT INTO `procedure_affair` VALUES ('dcdddd4e78684edf88e5f72fcbc28166', '招聘申请2(2018-03-05 20:31:50:李四_总经办)', 'ce2172ab-4e87-418e-b349-b5b5e627b2dd', '', '24555f7b3a364fb693e146952df67f5a', '66297dfc-8de4-4ee5-b10a-8f96405b45f2', '9c6a247f4187468b9fd052cbbb273995', 'zhangsandab', '0', '2018-03-05 20:31:50', '2019-06-03 22:55:22');

-- ----------------------------
-- Table structure for `procedure_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `procedure_attachment`;
CREATE TABLE `procedure_attachment` (
  `id` varchar(40) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `new_name` varchar(64) DEFAULT NULL,
  `affair_id` varchar(64) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_ATTACHMENTINSTANCE_ID_` (`affair_id`),
  CONSTRAINT `FK_ATTACHMENTINSTANCE_ID_` FOREIGN KEY (`affair_id`) REFERENCES `procedure_affair` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procedure_attachment
-- ----------------------------
INSERT INTO `procedure_attachment` VALUES ('4a6b0de797e243f2962fc5bb93fbdbb8', '关于档案软件开发项目要求汇总表.xlsx', '关于档案软件开发项目要求汇总表_20180307035453.xlsx', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:55:59', '2019-06-03 22:56:00');
INSERT INTO `procedure_attachment` VALUES ('b354180f503c4e24aa221acf7a0af057', 'oa系统说明文档.docx', 'oa系统说明文档_20180307035453.docx', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:55:59', '2019-06-03 22:56:00');
INSERT INTO `procedure_attachment` VALUES ('c05ca73a04354179af8969fecc2bc209', 'zppt2327.pptx', 'zppt2327_20180307035453.pptx', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:55:59', '2019-06-03 22:56:00');
INSERT INTO `procedure_attachment` VALUES ('d80f6d972c7a4929a71726a4b39ce0d6', 'generator.txt', 'generator_20180307035453.txt', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:55:59', '2019-06-03 22:56:00');
INSERT INTO `procedure_attachment` VALUES ('f32b05599f8d44d794856a713ad83083', '1 001.jpg', '1 001_20180307035453.jpg', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:55:59', '2019-06-03 22:56:00');

-- ----------------------------
-- Table structure for `procedure_control`
-- ----------------------------
DROP TABLE IF EXISTS `procedure_control`;
CREATE TABLE `procedure_control` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `value` varchar(512) DEFAULT NULL,
  `affair_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_CONTROL_INSTANCE_ID` (`affair_id`),
  CONSTRAINT `FK_CONTROL_INSTANCE_ID` FOREIGN KEY (`affair_id`) REFERENCES `procedure_affair` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procedure_control
-- ----------------------------
INSERT INTO `procedure_control` VALUES ('006776b0620942f09de2478b1048224b', '直接上级签字', 'zjsjqz', '张三_IT部', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('0615cabaae2a4eef9136e4760966545c', '申请部门意见', 'sqbmyj', 'IT部同意', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('0698bbe4a5a34387805d8751e48234ef', '申请部门签字', 'sqbmqz', '张三_IT部', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('0725d7048bf24b2184f8d53b7edc9a4c', '试用月薪', 'syyx', '6000', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('07bd47adb9504f368e93ad5ed0ebab0e', '试用年薪', 'synx', '48000.00', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('0bab49203dab452cbd159564b03b02bf', '年龄', 'nl', '22', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('11312355b4ab4fc5a4bc1f58e0f69129', '性别', 'xb', '男', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('14f56c2710d544baa32b8780fae91e03', '申请部门意见', 'sqbmyj', '档案部同意', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('150d817cb275468ab81e62fd03da1852', '转正年薪', 'zznx', '60000.00', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('167f0f4543574f1a89f271ca30d26884', '职称证书', 'zczs', '无', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('18371e1907024474a156e94a2ccf67dd', '转正年薪', 'zznx', '48000.00', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('20be5d7884ab4a23863904f5ef446c9d', '试用年薪', 'synx', '72000.00', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('2104b1a0e8f4476f97fd5454ce553ff3', '职位名称', 'zwmc', '客服专员', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('21b33d008fa645c2a0aced20d68f72db', '招聘相关要求', 'zpxgyq', '水平好', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('236cf70b935040c3b9fce6dbb3f153f0', '人事行政意见', 'rsxzyj', '人事行政同意', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('275e17d77fd84b2c8ea3955cc44aac07', '人事签字日期', 'rsqzrq', '2018-03-05 20:06:15', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('277ca34d73414116bd3ec5dc9a50d5e9', '试用月薪', 'syyx', '4000', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('2894f5be1e744526aa076a69c3f0704d', '职称证书', 'zczs', '无', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('2deddb571b8e4ac18166605936a2e5c9', '原有人数', 'yyrs', '2', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('2f7e3d2ce09f4ef8bea5768697910993', '申请人数', 'sqrs', '1', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('32b8d07475f9464e829f4069985293be', '董事长审批', 'dszsp', '董事长同意', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('32fc1ff2dae64854a7a8efcb2bc06220', '职务类别', 'zwlb', '职员', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('3d67a0603e2a4cc5b41067318e922562', '年龄', 'nl', '25', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('4237c6a750a8481cab37aeca775d87fa', '签字日期', 'bmqzrq', '2018-03-05 21:55:10', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('4b62897524dd4e2eba7773d71673a6e8', '申请人数', 'sqrs', '1', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('4c73822a5e334924a35b3101b06cb787', '转正年薪', 'zznx', '66000.00', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('4e2e3cdfb0c6427cb76c2722dbd629e9', '董事长签字', 'dszqz', '张三_董事长', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('504cb2ccbc8d43aea750433e9d930122', '申请部门签字', 'sqbmqz', '张三_档案部', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('5141a065618848ababc626d79785e9d4', '职位名称', 'zwmc', '数字加工人员', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('5493a8189050431fa47bf703cb4474ff', '性别', 'xb', '女', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('5a8eb32f0935472dac185daa428470da', '试用年薪', 'synx', '48000.00', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('5b066845bfba4794b239d745bacbf370', '年龄', 'nl', '25', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('5be176d1c5a44a3ca37e9dd59d3e99de', '职位名称', 'zwmc', '软件工程师', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('5e63d40e6b5443a39887171c34c70149', '试用月薪', 'syyx', '4000', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('631c419603a64c50a101ad194e59094b', '工作经验', 'gzjy', '无', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('649cf3b7987847e2bc4cf152eed8ffb2', '上级签字日期', 'sjqzrq', '2018-03-05 20:06:37', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('65dd98dd7a344532b524f6c466cee354', '增加人员理由', 'zjryly', '技术牛', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('6dfa327d8d8b4edfaad94fc0eb403056', '增加人员理由', 'zjryly', '能吃苦', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('73925b4232844b03a1209040477523ad', '申请日期', 'sqrq', '2018-03-05', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('79c09215106d42d7991f9cced1ca6b75', '职称证书', 'zczs', '无', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('7bc59dec18c740abbc7686a0a4560f40', '试用月薪', 'syyx', '3500', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('7bfc1a4653cf457794c930dee13defd9', '原有人数', 'yyrs', '30', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('7d74d647a9f84be7be9951f53d792e33', '试用年薪', 'synx', '42000.00', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('813a9b3f377f492d9c684aea32ca498e', '申请日期', 'sqrq', '2018-03-05', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('8184c7583b304d42abb0e1e7d941c44c', '工作经验', 'gzjy', '两年', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('869a7957bc2044c096b86e4ca26736ec', '签字日期', 'bmqzrq', '2018-03-05 20:05:52', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('8754aaa2827b4821b6ff476cb511854c', '申请部门', 'sqbm', '客服部', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('87a0aba4582740aaba5a11b693d6647a', '人事行政意见', 'rsxzyj', '行政部同意', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('8be18cebfa0c48e6becfffac6edc6bb4', '教育程度', 'jycd', '本科及以上', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('93ad020a5a6f4f0d8058b1df28a865cd', '申请部门', 'sqbm', '档案部', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('94400fa47387469b839dbbd3bcdf1f8c', '招聘相关要求', 'zpxgyq', '有责任心', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('948cacd185384478bd64e6fb0440d047', '转正年薪', 'zznx', '84000.00', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('967811adefe34c179a359ace4811a29c', '性别', 'xb', '男', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('98ea58d07aa94456948b8c6c460cd395', '教育程度', 'jycd', '本科及以上', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('9b67731594ae4db1964c5e7efc293bab', '增加人员理由', 'zjryly', '技术高', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('9c42971b8aa04064b99fd38771ce3088', '工作经验', 'gzjy', '无', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('9ff1cf901b104302a98b0aaeda1ea3cb', '职务类别', 'zwlb', '新增', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('a09db5fed44942daa104482ba47685ca', '转正月薪', 'zzyx', '4000', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('a884ef0cea884fa2bd01537ed9cd4c71', '转正月薪', 'zzyx', '5500', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('a98ceaf2e476448a9aed1c65443599f5', '年龄', 'nl', '22', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('ad046889b56f46d5bdd6d79a0f9792a5', '人事签字日期', 'rsqzrq', '2018-03-05 21:59:17', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('afcad75d5cd64f97ae55de95ffb1dfdc', '教育程度', 'jycd', '本科及以上', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('b20db4e912ab4e3980c235230153f46d', '职务类别', 'zwlb', '新增', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('b241634366704ce985e4b08d7d343c38', '性别', 'xb', '男', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('b6459d3003b64a59a11c300f45368465', '董事长签字日期', 'dszqzrq', '2018-03-05 20:25:51', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('bc0e76985e76438080cab88b91c577c8', '职称证书', 'zczs', '无', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('bc2ae21a590e4119ba514461dc578014', '申请日期', 'sqrq', '2018-03-07', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('bc774b7cc6c748a9b22beb9cd8dde7aa', '申请日期', 'sqrq', '2018-03-07', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('c6965318d32743d6ae6ec233a0c81b71', '招聘相关要求', 'zpxgyq', '有能力', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('c88510072b7f4b3fa11779a5b2d9e15b', '增加人员理由', 'zjryly', '沟通能力好', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('c890bd10d02b4ba9a1e89a2f45b5dde9', '申请部门', 'sqbm', 'IT部', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('c92151fa463f40418a4b31083ddbb8a3', '招聘相关要求', 'zpxgyq', '善于交际', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('d201601e47374823b2da652f8974c2da', '职位名称', 'zwmc', '软件工程师', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('d2ece97cbe8847c3ab239af10886274f', '转正月薪', 'zzyx', '5000', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('d398ffefb4d8439dbd1f6c335c394914', '申请人数', 'sqrs', '1', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('da7c5c32b8d44aafa32028bd7c304ff1', '职务类别', 'zwlb', '新增', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('df16d9137a164d678357cba97c63f015', '原有人数', 'yyrs', '5', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('e2727b6adc9942999b8d5881ddc99b40', '工作经验', 'gzjy', '一年', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('e8f8081888b04c9ba2884b9d7965ef35', '人事行政签字', 'rsxzqz', '张三_行政部', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('eb279a7e1d344c5bb8a5e775991f545d', '人事行政签字', 'rsxzqz', '张三_行政部', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('f438ee754fe24ebc89e71dd66a25051f', '申请人数', 'sqrs', '1', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('f5394d204d7049a9881603fabfc46356', '转正月薪', 'zzyx', '7000', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('f5d8b1e8508f4289a9cc629958a4c357', '教育程度', 'jycd', '本科及以上', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('f77d9a2a27c14acc8afcdf114d46ab0a', '直接上级意见', 'zjsjyj', '直接上级同意', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('fe7a0cc567f74d07821b7ccb7dad4004', '申请部门', 'sqbm', 'IT部', 'bbd47dfd438341db85c1a6223cca068c', '2019-06-03 22:56:12', '2019-06-03 22:56:13');
INSERT INTO `procedure_control` VALUES ('fee51937daf64fcab08662c5094831fe', '原有人数', 'yyrs', '2', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:12', '2019-06-03 22:56:13');

-- ----------------------------
-- Table structure for `procedure_node`
-- ----------------------------
DROP TABLE IF EXISTS `procedure_node`;
CREATE TABLE `procedure_node` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `flow_number` varchar(32) DEFAULT NULL,
  `proc_id` varchar(40) DEFAULT NULL,
  `controls` varchar(1024) DEFAULT NULL,
  `handlers` varchar(1024) DEFAULT NULL,
  `branch` varchar(1024) DEFAULT NULL,
  `branch_js` varchar(1024) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_PROCEDURE_ID` (`proc_id`),
  CONSTRAINT `FK_PROCEDURE_ID` FOREIGN KEY (`proc_id`) REFERENCES `procedure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procedure_node
-- ----------------------------
INSERT INTO `procedure_node` VALUES ('03caf965236c49d2b62c1c07da873798', '董事长审批', '6', '', '24555f7b3a364fb693e146952df67f5a', 'dszsp_董事长审批,dszqz_董事长签字,dszqzrq_董事长签字日期', '张三_董事长(zhangsandsz)', null, null, '2019-06-03 22:56:23', '2019-06-03 22:56:24');
INSERT INTO `procedure_node` VALUES ('7a9f86426daf4e25bfa2d20f75473a30', '申请部门意见', '2', '3', '24555f7b3a364fb693e146952df67f5a', 'sqbmyj_申请部门意见,sqbmqz_申请部门签字,bmqzrq_签字日期', '张三_档案部(zhangsandab),李四_档案部(lisidab),李四_成品仓(lisicpc),张三_成品仓(zhangsancpc),张三_客服部(zhangsankfb),李四_客服部(lisikfb),张三_总经办(zhangsanzjb),李四_总经办(lisizjb),张三_销售部(zhangsanxsb),李四_销售部(lisixsb),李四_生产部(lisiscb),张三_生产部(zhangsanscb),李四_设计部(lisisjb),张三_设计部(zhangsansjb),张三_技术部(zhangsanjsb),李四_技术部(lisijsb),张三_物流部(zhangsanwlb),李四_物流部(lisiwlb),张三_设备部(zhangsansbb),李四_设备部(lisisbb),张三_IT部(zhangsanitb),李四_IT部(lisiitb),张三_综合办(zhangsanzhb),李四_综合办(lisizhb),李四_财务部(lisicwb),张三_财务部(zhangsancwb),李四_采购部(lisicgb),张三_采购部(zhangsancgb),张三_行政部(zhangsanxzb),李四_行政部(lisixzb)', null, null, '2019-06-03 22:56:23', '2019-06-03 22:56:24');
INSERT INTO `procedure_node` VALUES ('9c6a247f4187468b9fd052cbbb273995', '直接上级意见', '4', '5,6', '24555f7b3a364fb693e146952df67f5a', 'zjsjyj_直接上级意见,zjsjqz_直接上级签字,sjqzrq_上级签字日期', '张三_档案部(zhangsandab),李四_档案部(lisidab),李四_成品仓(lisicpc),张三_成品仓(zhangsancpc),张三_客服部(zhangsankfb),李四_客服部(lisikfb),张三_总经办(zhangsanzjb),李四_总经办(lisizjb),张三_销售部(zhangsanxsb),李四_销售部(lisixsb),李四_生产部(lisiscb),张三_生产部(zhangsanscb),李四_设计部(lisisjb),张三_设计部(zhangsansjb),张三_技术部(zhangsanjsb),李四_技术部(lisijsb),张三_物流部(zhangsanwlb),李四_物流部(lisiwlb),张三_设备部(zhangsansbb),李四_设备部(lisisbb),张三_IT部(zhangsanitb),李四_IT部(lisiitb),张三_综合办(zhangsanzhb),李四_综合办(lisizhb),李四_财务部(lisicwb),张三_财务部(zhangsancwb),李四_采购部(lisicgb),张三_采购部(zhangsancgb),张三_行政部(zhangsanxzb),李四_行政部(lisixzb)', '5_!_zzyx_<_5000,5_&&_sqrs_<_3', 'var order=5;function setSeqnum(zzyx,sqrs){if(zzyx < 5000 && sqrs < 3){order=5;}else{order=6;}}setSeqnum(zzyx,sqrs);//zzyx,sqrs', '2019-06-03 22:56:23', '2019-06-03 22:56:24');
INSERT INTO `procedure_node` VALUES ('9eeeae8162184a4796d44979f42c5618', '总经理审批', '5', '', '24555f7b3a364fb693e146952df67f5a', 'zjlsp_总经理审批,zjlqz_总经理签字,zjlqzrq_总经理签字日期', '李四_总经理(lisizjl),张三_总经理(zhangsanzjl)', null, null, '2019-06-03 22:56:23', '2019-06-03 22:56:24');
INSERT INTO `procedure_node` VALUES ('b56d558bc1be48c08f2bb32e7fade1a7', '发起流程', '1', '2', '24555f7b3a364fb693e146952df67f5a', 'sqbm_申请部门,sqrq_申请日期,sqrs_申请人数,zwmc_职位名称,yyrs_原有人数,zwlb_职务类别,zjryly_增加人员理由,zpxgyq_招聘相关要求,syyx_试用月薪,synx_试用年薪,zzyx_转正月薪,zznx_转正年薪,jycd_教育程度,xb_性别,nl_年龄,gzjy_工作经验,zczs_职称证书', null, null, null, '2019-06-03 22:56:23', '2019-06-03 22:56:24');
INSERT INTO `procedure_node` VALUES ('e4d3a379055941bea5b64504d64e28c4', '人事行政意见', '3', '4', '24555f7b3a364fb693e146952df67f5a', 'rsxzyj_人事行政意见,rsxzqz_人事行政签字,rsqzrq_人事签字日期', '张三_行政部(zhangsanxzb),李四_行政部(lisixzb)', null, null, '2019-06-03 22:56:23', '2019-06-03 22:56:24');

-- ----------------------------
-- Table structure for `procedure_process`
-- ----------------------------
DROP TABLE IF EXISTS `procedure_process`;
CREATE TABLE `procedure_process` (
  `id` varchar(40) NOT NULL,
  `handle_time` datetime DEFAULT NULL,
  `handler_` varchar(80) DEFAULT NULL,
  `node_name` varchar(40) DEFAULT NULL,
  `node_order` int(11) DEFAULT NULL,
  `affair_id` varchar(40) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`affair_id`),
  KEY `FK_PROCESS_procedure_HANDLER_ID` (`handler_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procedure_process
-- ----------------------------
INSERT INTO `procedure_process` VALUES ('019c8474c10443ea9536b6eb3eff2e3a', '2018-03-05 22:01:33', '张三_行政部(zhangsanxzb)', '人事行政意见', '3', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('2893be2616fb43a6b1e2cc2d2e8b4176', '2018-03-07 15:54:54', '张三_档案部(zhangsandab)', '发起流程', '1', '1b208e118c474464bb02a0b6516dcade', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('4478a08f64fe443ca94a08f591983b44', '2018-03-05 20:06:06', '张三_IT部(zhangsanitb)', '申请部门意见', '2', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('4b12bd79bea24687954a94ca892c060c', '2018-03-05 20:25:58', '张三_董事长(zhangsandsz)', '董事长审批', '6', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('573ec80732ab426db2c22a70128d70e8', '2018-03-05 20:05:17', '张三_总经办(zhangsanzjb)', '发起流程', '1', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('67a8e8f9732d4ea3b1a9fbfbf60cefad', '2018-03-05 20:08:16', '张三_IT部(zhangsanitb)', '直接上级意见', '4', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('6ae7d7801db04dc3b4e626961ba47bc2', '2018-03-05 21:55:39', '张三_档案部(zhangsandab)', '申请部门意见', '2', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('e95ca8bbe67b43339f5920b12eff3d46', '2018-03-05 20:06:28', '张三_行政部(zhangsanxzb)', '人事行政意见', '3', '116571bf58534894a0348aca58bea92d', '2019-06-03 22:56:34', '2019-06-03 22:56:35');
INSERT INTO `procedure_process` VALUES ('fb017ef493aa41f9ac3ec9decb156cd4', '2018-03-05 21:40:12', '李四_总经办(lisizjb)', '发起流程', '1', 'dcdddd4e78684edf88e5f72fcbc28166', '2019-06-03 22:56:34', '2019-06-03 22:56:35');

-- ----------------------------
-- Table structure for `procedure_type`
-- ----------------------------
DROP TABLE IF EXISTS `procedure_type`;
CREATE TABLE `procedure_type` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procedure_type
-- ----------------------------
INSERT INTO `procedure_type` VALUES ('33233e20-8044-403b-9fb2-bb4b17fed0b6', '营销流程', '5', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('4c120d5c-d973-4439-b26c-f3b9f4dd4834', '经济事务', '4', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('4c285c0e-3f7b-45ab-980d-2070a4fe8efc', '物资流程', '3', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('6f5d6f50-92d5-4c92-b0db-0461db3ebc95', '日常事务', '1', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('7c373d8e-bfcc-4414-9bb5-503c78c3fd51', '工程流程', '7', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('82214233-a64b-4baa-b4b1-3c1c7f891aed', '公司日常流程', '6', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('8fd9222b-4d71-44b7-a9ed-18cdd73d437f', '卓之印', '8', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('9bcd6f49-5d7d-48c2-9e91-dbe9bd5ba30f', '行政事务', '2', '2019-06-03 22:56:45', '2019-06-03 22:56:45');
INSERT INTO `procedure_type` VALUES ('fba0470f-7346-4f68-8ba6-e4618ec3fa38', '通罗物流', '9', '2019-06-03 22:56:45', '2019-06-03 22:56:45');

-- ----------------------------
-- Table structure for `work_affair_statistic`
-- ----------------------------
DROP TABLE IF EXISTS `work_affair_statistic`;
CREATE TABLE `work_affair_statistic` (
  `id` varchar(40) NOT NULL,
  `emp` varchar(64) DEFAULT NULL,
  `start_num1` int(11) DEFAULT NULL,
  `handle_num1` int(11) DEFAULT NULL,
  `start_num2` int(11) DEFAULT NULL,
  `handle_num2` int(11) DEFAULT NULL,
  `start_num3` int(11) DEFAULT NULL,
  `handle_num3` int(11) DEFAULT NULL,
  `start_num4` int(11) DEFAULT NULL,
  `handle_num4` int(11) DEFAULT NULL,
  `start_num5` int(11) DEFAULT NULL,
  `handle_num5` int(11) DEFAULT NULL,
  `start_num6` int(11) DEFAULT NULL,
  `handle_num6` int(11) DEFAULT NULL,
  `start_num7` int(11) DEFAULT NULL,
  `handle_num7` int(11) DEFAULT NULL,
  `start_num8` int(11) DEFAULT NULL,
  `handle_num8` int(11) DEFAULT NULL,
  `start_num9` int(11) DEFAULT NULL,
  `handle_num9` int(11) DEFAULT NULL,
  `start_num10` int(11) DEFAULT NULL,
  `handle_num10` int(11) DEFAULT NULL,
  `month` char(7) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_affair_statistic
-- ----------------------------
INSERT INTO `work_affair_statistic` VALUES ('00a24b615c164f1aa73aff999a42fada', '李四_总经办(lisizjb)', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '2018-03', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('1087a9c8a78340dd9230247a944e81c1', '张三_IT部(zhangsanitb)', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2018-03', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('22f44b033e13482997fae032d1d38195', '张三_总经办(zhangsanzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-04', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('40e9e2eb5d5445a8bce2252bd9549e87', '张三_行政部(zhangsanxzb)', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2018-03', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('533bc272873b4848a491896a04fe0021', '李四_总经办(lisizjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-04', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('582c7877c48f4d1ba2eff6df6a65ce2e', '张三_总经办(zhangsanzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-11', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('60d21b14959c4b5597ef33a746d0ef48', '张三_总经办(zhangsanzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-06', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('65ba891712f34410abe9f6c89dc7d9af', '张三_IT部(zhangsanitb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-05', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('6874b1ef1ee049668c9423ff66318c55', '李四_总经办(lisizjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-05', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('6f9660e2d5ec4377b6be2839fd16e254', '王二_总经办(wangerzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-05', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('7263144ba87e481fb161eb76e869c047', '张三_董事长(zhangsandsz)', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2018-03', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('7e105d61ca0246fe9d4c138e788b1a1c', '小明(xiaoming)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-04', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('8921240d9e7f46ddb0de3131c5a11602', '张三_档案部(zhangsandab)', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '2018-03', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('bc586dc32541465fbd9e3627dae1cb0d', '张三_综合办(zhangsanzhb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-04', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('c868f9823a4f42438da59839d767022f', '张三_总经办(zhangsanzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-05', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('db5032da5c2d46e0ac1295a3de497dbe', '张三_总经办(zhangsanzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-05', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('e280ce4534dc4e04a35bc08f6757e568', '王二_总经办(wangerzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2018-04', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('f4312eb6aabb4394bf2aca66583c60be', '张三_总经办(zhangsanzjb)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-04', '2019-06-03 22:56:55', '2019-06-03 22:56:55');
INSERT INTO `work_affair_statistic` VALUES ('ffe1196327bf4ab1853cb55983148a21', '张三_总经办(zhangsanzjb)', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '2018-03', '2019-06-03 22:56:55', '2019-06-03 22:56:55');

-- ----------------------------
-- Table structure for `work_duty`
-- ----------------------------
DROP TABLE IF EXISTS `work_duty`;
CREATE TABLE `work_duty` (
  `id` varchar(40) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `sponsor` varchar(40) DEFAULT NULL,
  `launch_date` datetime DEFAULT NULL,
  `executor` varchar(40) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `evaluate` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_duty
-- ----------------------------
INSERT INTO `work_duty` VALUES ('068e561129e14c32b3dd59e1c2eedce1', '任务11', '内容11', '张三_档案部(zhangsandab)', '2018-04-19 14:11:14', '王二_综合办(wangerzhb)', '2018-04-23', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('1598055cde694199b25b42fe1a82b807', '任务9', '内容9', '张三_生产部(zhangsanscb)', '2018-04-19 14:11:14', '王二_生产部(wangerscb)', '2018-04-28', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('1b8ac56f130a4166acd41d07bdac0ab8', '任务43', '内容43', '张三_设计部(zhangsansjb)', '2018-04-19 14:11:14', '李四_设备部(lisisbb)', '2018-04-25', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('22baf8aa1cd746eda5ff6ee134439176', '任务18', '内容18', '李四_采购部(lisicgb)', '2018-04-19 14:11:14', '王二_设备部(wangersbb)', '2018-05-03', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('23b3472748434d9a9f1b6765a5a78248', '任务64', '内容64', '麻子_生产部(maziscb)', '2018-04-19 14:11:14', '李四_财务部(lisicwb)', '2018-04-27', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('2b4458398b1a4ae984925c9ef4d40d8d', '任务30', '内容30', '麻子_采购部(mazicgb)', '2018-04-19 14:11:14', '李四_生产部(lisiscb)', '2018-04-28', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('2bd727130f3a4871948198eb1e5abe57', '任务47', '内容47', '李四_技术部(lisijsb)', '2018-04-19 14:11:14', '张三_行政部(zhangsanxzb)', '2018-04-30', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('2c83cbbaf1394deabea329248aaf762d', '任务34', '内容34', '麻子_设计部(mazisjb)', '2018-04-19 14:11:14', '李四_客服部(lisikfb)', '2018-05-01', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('2cb42d91ba8d4697911455350a953974', '任务53', '内容53', '张三_总经理(zhangsanzjl)', '2018-04-19 14:11:14', '张三_设备部(zhangsansbb)', '2018-05-07', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('33dc041f51a541c7863dedd8eb609ce4', '任务58', '内容58', '李四_档案部(lisidab)', '2018-04-19 14:11:14', '麻子_行政部(mazixzb)', '2018-05-10', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('34609e496d4340e4bb539277ca0261af', '任务39', '内容39', '李四_IT部(lisiitb)', '2018-04-19 14:11:14', '李四_综合办(lisizhb)', '2018-04-28', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('362d3cc229e540499c6d006e562e2d44', '任务66', '内容66', '王二_IT部(wangeritb)', '2018-04-19 14:11:14', '张三_销售部(zhangsanxsb)', '2018-05-03', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('4015afd5aa3b413f8657f445cf810e20', '任务49', '内容49', '麻子_财务部(mazicwb)', '2018-04-19 14:11:14', '麻子_客服部(mazikfb)', '2018-05-17', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('4363a5a079e442c3bd68a69913f3a013', '任务33', '内容33', '王二_成品仓(wangercpc)', '2018-04-19 14:11:14', '麻子_设计部(mazisjb)', '2018-05-03', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('43ddada014e840d1a0a182e2f947db25', '任务4', '内容4', '王二_技术部(wangerjsb)', '2018-04-19 14:11:14', '麻子_IT部(maziitb)', '2018-04-30', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('44c288aa9da0498ba470c6d9d4294de1', '任务40', '内容40', '李四_综合办(lisizhb)', '2018-04-19 14:11:14', '麻子_档案部(mazidab)', '2018-04-23', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('479dc51cbe0c439e8bcb1d054000c0cc', '任务48', '内容48', '张三_行政部(zhangsanxzb)', '2018-04-19 14:11:14', '麻子_财务部(mazicwb)', '2018-04-22', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('4819dd67043f4dca9d07c1a0fa92a485', '任务26', '内容26', '李四_设计部(lisisjb)', '2018-04-19 14:11:14', '王二_行政部(wangerxzb)', '2018-04-25', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('4b033df3fd57464fa97bdd8a867485bd', '任务10', '内容10', '王二_生产部(wangerscb)', '2018-04-19 14:11:14', '张三_档案部(zhangsandab)', '2018-04-28', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('4e643cab17314baa8e049c76c31629cd', '任务65', '内容65', '李四_财务部(lisicwb)', '2018-04-19 14:11:14', '王二_IT部(wangeritb)', '2018-04-26', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('505cf7fe5fb144deb0989ff0cd8500a5', '任务19', '内容19', '王二_设备部(wangersbb)', '2018-04-19 14:11:14', '王二_客服部(wangerkfb)', '2018-04-25', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('580bd8333de445a089235f52edca8f28', '任务22', '内容22', '王二_总经办(wangerzjb)', '2018-04-19 14:11:14', '麻子_技术部(mazijsb)', '2018-04-23', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('58bc5e1f436d4a6ba12f81ccb22d0273', '任务29', '内容29', '张三_董事长(zhangsandsz)', '2018-04-19 14:11:14', '麻子_采购部(mazicgb)', '2018-04-21', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('5b09f5015e5048228727be19486186b5', '任务62', '内容62', '张三_采购部(zhangsancgb)', '2018-04-19 14:11:14', '张三_物流部(zhangsanwlb)', '2018-04-24', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('5e7db0f82950473db87e605896cf235a', '任务16', '内容16', '张三_总经办(zhangsanzjb)', '2018-04-19 14:11:14', '张三_IT部(zhangsanitb)', '2018-04-28', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('635dd8ac4c72493e84d587051e722b25', '任务44', '内容44', '李四_设备部(lisisbb)', '2018-04-19 14:11:14', '王二_档案部(wangerdab)', '2018-04-29', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('66632801c2b94fbcb2806bd4ea3fe46a', '任务7', '内容7', '赵洋(zhaoyang)', '2018-04-19 14:11:14', '李四_成品仓(lisicpc)', '2018-05-02', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('68d9a61c67e84ad29d4aaba0d2e0f843', '任务50', '内容50', '麻子_客服部(mazikfb)', '2018-04-19 14:11:14', '李四_物流部(lisiwlb)', '2018-05-23', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('6a5ee4ca14d44b19849d39eafa877389', '任务36', '内容36', '王二_销售部(wangerxsb)', '2018-04-19 14:11:14', '王二_物流部(wangerwlb)', '2018-04-25', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('73d7cd2623c7424ba13236bfd971691e', '任务17', '内容17', '张三_IT部(zhangsanitb)', '2018-04-19 14:11:14', '李四_采购部(lisicgb)', '2018-05-08', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('7613b656011c4dedb7ca9524d32b8b52', '任务20', '内容20', '王二_客服部(wangerkfb)', '2018-04-19 14:11:14', '李四_行政部(lisixzb)', '2018-04-23', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('7953b645ec404612a5f6df2c925093c5', '任务3', '内容3', '张三_综合办(zhangsanzhb)', '2018-04-19 14:11:14', '王二_技术部(wangerjsb)', '2018-04-25', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('7e95a29986bf418e81b2e7f8e4c5182f', '任务51', '内容51', '李四_物流部(lisiwlb)', '2018-04-19 14:11:14', '李四_总经办(lisizjb)', '2018-05-10', '1', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('88c015788f02495e91fb1cfa4d92f3c6', '任务15', '内容15', '麻子_销售部(mazixsb)', '2018-04-19 14:11:14', '张三_总经办(zhangsanzjb)', '2018-05-08', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('8c038f9c4ef14719b47dfa08b7c7586a', '任务61', '内容61', '张三_成品仓(zhangsancpc)', '2018-04-19 14:11:14', '张三_采购部(zhangsancgb)', '2018-05-04', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('8cf155e1d5ed4477bad6d95942399908', '任务38', '内容38', '小明(xiaoming)', '2018-04-19 14:11:14', '李四_IT部(lisiitb)', '2018-05-03', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('8ddf169bf2d1429eb47b1b7fd373c309', '任务35', '内容35', '李四_客服部(lisikfb)', '2018-04-19 14:11:14', '王二_销售部(wangerxsb)', '2018-05-24', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('906bc0b72e7c4f15ae88ea3effd7dac4', '任务41', '内容41', '麻子_档案部(mazidab)', '2018-04-19 14:11:14', '李四_销售部(lisixsb)', '2018-05-21', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('90c4caf2e7a2462c8eb309d6cb55ae0a', '任务14', '内容14', '张三_财务部(zhangsancwb)', '2018-04-19 14:11:14', '麻子_销售部(mazixsb)', '2018-05-14', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('91447fa9641c4978a7ba9b7381bf2ec1', '任务55', '内容55', '麻子_成品仓(mazicpc)', '2018-04-19 14:11:14', '麻子_总经办(mazizjb)', '2018-05-13', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('93cac2638eec49b4acb065abbeaad128', '任务32', '内容32', '张三_技术部(zhangsanjsb)', '2018-04-19 14:11:14', '王二_成品仓(wangercpc)', '2018-04-28', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('9454f6b6c8554ca8bae90f90f2193c46', '任务42', '内容42', '李四_销售部(lisixsb)', '2018-04-19 14:11:14', '张三_设计部(zhangsansjb)', '2018-05-09', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('95053b7a798d4efbbf3405d79588b4b8', '任务45', '内容45', '王二_档案部(wangerdab)', '2018-04-19 14:11:14', '王二_设计部(wangersjb)', '2018-05-07', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('951a2dc732b547fa9b210d1162994435', '任务27', '内容27', '王二_行政部(wangerxzb)', '2018-04-19 14:11:14', '麻子_综合办(mazizhb)', '2018-05-04', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('99c18c817dd642fea3926893f0b81493', '任务31', '内容31', '李四_生产部(lisiscb)', '2018-04-19 14:11:14', '张三_技术部(zhangsanjsb)', '2018-04-19', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('9c4a918410f5439193930b98e970777b', '任务8', '内容8', '李四_成品仓(lisicpc)', '2018-04-19 14:11:14', '张三_生产部(zhangsanscb)', '2018-04-19', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('9c8e531906904be98cf89d5a84fc4f9e', '任务57', '内容57', '王二_采购部(wangercgb)', '2018-04-19 14:11:14', '李四_档案部(lisidab)', '2018-04-19', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('9f182bc4a0454fb095601d6002fe22ee', '任务2', '内容2', '李四_总经办(lisizjb)', '2018-04-19 13:31:08', '王二_生产部(wangerscb)', '2018-05-01', '0', '', null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('a4adc436234443f99c090a06f7fa288d', '任务60', '内容60', '张三_客服部(zhangsankfb)', '2018-04-19 14:11:14', '张三_成品仓(zhangsancpc)', '2018-04-19', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('a6beedd8b1e44966ac66a264beda0713', '任务54', '内容54', '张三_设备部(zhangsansbb)', '2018-04-19 14:11:14', '麻子_成品仓(mazicpc)', '2018-05-30', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('b2ea50e314654af9911bc7bbe8deb3a8', '任务25', '内容25', '李四_总经理(lisizjl)', '2018-04-19 14:11:14', '李四_设计部(lisisjb)', '2018-06-02', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('b9c669a8a23940cb9cdddf77bacbb314', '任务5', '内容5', '麻子_IT部(maziitb)', '2018-04-19 14:11:14', '麻子_物流部(maziwlb)', '2018-05-15', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('ba115615bd4f4c98a6810f938061bcd6', '任务12', '内容12', '王二_综合办(wangerzhb)', '2018-04-19 14:11:14', '麻子_设备部(mazisbb)', '2018-05-14', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('bab2cbc642314f759efdec44818c22ae', '任务52', '内容52', '李四_总经办(lisizjb)', '2018-04-19 14:11:14', '张三_总经理(zhangsanzjl)', '2018-04-24', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('bcde79f9e0af42d29c3cc4b05945c915', '任务56', '内容56', '麻子_总经办(mazizjb)', '2018-04-19 14:11:14', '王二_采购部(wangercgb)', '2018-04-23', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('c6ba9a8810dc4b098cc5db0d16b848fa', '任务37', '内容37', '王二_物流部(wangerwlb)', '2018-04-19 14:11:14', '小明(xiaoming)', '2018-04-19', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('cb5eceacbeee46fb84ae91c338e6e89a', 'aaa', 'aaa', '张三_总经办(zhangsanzjb)', '2018-04-20 16:22:07', '李四_总经办(lisizjb)', '2018-04-30', '1', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('cb95a01061d24b8b9441079e4c33e45c', '任务1', '内容1', '张三_总经办(zhangsanzjb)', '2018-04-18 13:26:22', '小明(xiaoming)', '2018-04-28', '3', '老板，任务已经完成', null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('d18eefc7643a40c3a119c68b1cbb9cc9', '任务59', '内容59', '麻子_行政部(mazixzb)', '2018-04-19 14:11:14', '张三_客服部(zhangsankfb)', '2018-04-19', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('d91d57cdb17a419aa51b9d32ae60b9dc', '任务46', '内容46', '王二_设计部(wangersjb)', '2018-04-19 14:11:14', '李四_技术部(lisijsb)', '2018-04-19', '3', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('dd75f14ac1fe429195a14d3d1f76ba1c', '任务24', '内容24', '王二_财务部(wangercwb)', '2018-04-19 14:11:14', '李四_总经理(lisizjl)', '2018-04-21', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('efe76d07f7314cc0af2f963f3b3d2080', '任务63', '内容63', '张三_物流部(zhangsanwlb)', '2018-04-19 14:11:14', '麻子_生产部(maziscb)', '2018-04-19', '4', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('f18e1d3275c74873b58c8bcf7f042af1', '任务13', '内容13', '麻子_设备部(mazisbb)', '2018-04-19 14:11:14', '张三_财务部(zhangsancwb)', '2018-04-19', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('f556af61e6d346cf92924005c5eb659d', '任务23', '内容23', '麻子_技术部(mazijsb)', '2018-04-19 14:11:14', '王二_财务部(wangercwb)', '2018-04-19', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('f7b99a9ead3943c093ce97034232564c', '任务28', '内容28', '麻子_综合办(mazizhb)', '2018-04-19 14:11:14', '张三_董事长(zhangsandsz)', '2018-04-19', '0', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('f8090e07e29e47019c69ff232ee15caf', '任务21', '内容21', '李四_行政部(lisixzb)', '2018-04-19 14:11:14', '王二_总经办(wangerzjb)', '2018-04-19', '2', null, null, null, null, '2019-06-03 22:57:13');
INSERT INTO `work_duty` VALUES ('f85e753962c540a69c8ead413a9c43ac', '任务6', '内容6', '麻子_物流部(maziwlb)', '2018-04-19 14:11:14', '赵洋(zhaoyang)', '2018-04-19', '4', null, null, null, null, '2019-06-03 22:57:13');

-- ----------------------------
-- Table structure for `work_duty_statistic`
-- ----------------------------
DROP TABLE IF EXISTS `work_duty_statistic`;
CREATE TABLE `work_duty_statistic` (
  `id` varchar(40) NOT NULL,
  `executor` varchar(40) DEFAULT NULL,
  `complete_num` int(11) DEFAULT NULL,
  `total_num` int(11) DEFAULT NULL,
  `month` char(7) DEFAULT NULL,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_duty_statistic
-- ----------------------------
INSERT INTO `work_duty_statistic` VALUES ('03820f17c96e4d5487dbd9ed5d78ba93', '李四_档案部(lisidab)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('04cca4daadb04206954dae657e464724', '李四_生产部(lisiscb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('06dab9f8a19a4b729ca8bab1ed5207bf', '李四_采购部(lisicgb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('08cc613f759644169dd6af1d3d28c9cc', '张三_财务部(zhangsancwb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('0b80d9a95ee24d1aaa1ae16f0c68146f', '张三_董事长(zhangsandsz)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('0b9fea4012e841c5abea15132b54199c', '麻子_成品仓(mazicpc)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('0db2f234958b4b609fda7f049c1658ec', '麻子_物流部(maziwlb)', '1', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('0db6751016e84847ae9a2c4463269edb', '张三_综合办(zhangsanzhb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('11168e80e5084948a4024436a5d6245d', '王二_采购部(wangercgb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('126b1fce05664219aac49493a6d9c0b0', '李四_总经办(lisizjb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('132e58cd18d14bcdb9535c8a1c8f9ada', '李四_技术部(lisijsb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('1550aa72ccfb4adb90f630a4a059a4c6', '王二_物流部(wangerwlb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('15a7132d7f12466298547b746057a6a1', '张三_技术部(zhangsanjsb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('15e9277ac84b420296cd30baab777d9d', '张三_总经理(zhangsanzjl)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('17662bc75b2241eabd719df3577f7c09', '赵洋(zhaoyang)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('19b08d7c7f5d455dadb4bfc2fadb2ffc', '麻子_财务部(mazicwb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('1c9659e3461e429496d943fce68e25b5', '张三_总经理(zhangsanzjl)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('1e42b4e2f2dc42de8ca8d52a09cbf8fe', '王二_综合办(wangerzhb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('1ed66ce446bc488883a4f54eab1c7fb3', '张三_IT部(zhangsanitb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('20d743053395431082c2178e2293aed2', '张三_总经办(zhangsanzjb)', null, null, '2019-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('2299ade2534a44edaedf5941b0efe4e5', '李四_总经理(lisizjl)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('22ae0bd3dbdd4b7aa8559829094bbbb1', '麻子_IT部(maziitb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('24ad8aa5985449d8adfe698631e31469', '王二_技术部(wangerjsb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('269d9e0a618049efb82992b011c29d10', '麻子_设备部(mazisbb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('30d9ac8ee5dc468784727e3087f5b8a3', '王二_总经办(wangerzjb)', '0', '2', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('30f0295864ad4f44a5e892a7b7a2c171', '张三_设计部(zhangsansjb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('3138e0db7b9c4cdc8660bda98f968576', '李四_物流部(lisiwlb)', '1', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('369e579066594f3a89ae3fea589a3fde', '李四_客服部(lisikfb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('36cf822379c74c18a7b041e6753b8b9a', '李四_物流部(lisiwlb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('37828d7ca42542979c8cef3127906092', '张三_客服部(zhangsankfb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('403a95f965284c3ca937e29be506d700', '王二_行政部(wangerxzb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('41d5e1d467bd4874b4677c64d6910c17', '张三_采购部(zhangsancgb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('44102eb4b3ce4669a7a2e704f2e876ee', '小明(xiaoming)', '2', '2', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('450689a9d4fb4e1eac090a1530d67fcc', '麻子_档案部(mazidab)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('474fea162ed1497ea01d3db17f285495', '王二_财务部(wangercwb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('4757ed07c5dd4e469232ce2f6e93c058', '李四_财务部(lisicwb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('4c41ceaa72e64b2c9602103bacc11824', '王二_生产部(wangerscb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('4d332ea852c6465cb8cdfc3de2d7d484', '王二_总经办(wangerzjb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('4e01cd592f5a464ea072b9c6d43b90f2', '麻子_总经办(mazizjb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('51dc541a74194ec59d32d0100eedbdfb', '李四_设备部(lisisbb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('540bd118837b4f15b8e73e187b591d86', '张三_生产部(zhangsanscb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('59a04dae0aa145009772b89cacdb0791', '麻子_设计部(mazisjb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('5ad1af971b394a8fbbd5191c3a343603', '王二_档案部(wangerdab)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('5c5345bfe35d44aabe6953f4fb2936ad', '王二_设计部(wangersjb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('5e5e2a6157e348aabe3117998abdf02c', '王二_生产部(wangerscb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('5f3d4f2d66934ad8bfeb3c00158058e6', '李四_财务部(lisicwb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('5fbf143948ac4421b31fff2317730488', '李四_总经理(lisizjl)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('600dac9058f446aa97ed05f55df40078', '王二_客服部(wangerkfb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('639643d89116416c9cf7f86e348be64e', '张三_成品仓(zhangsancpc)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('642f04dada0d488482561357cd788622', '麻子_档案部(mazidab)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('642fb3f7ee124a90a303c58974a23913', '王二_成品仓(wangercpc)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('6485cb91b0df4ece8a5ded82c7d9b3b0', '王二_IT部(wangeritb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('663f634ad1274f529ef6c51b41dfdcf4', '张三_综合办(zhangsanzhb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('66784841276640548d9532827eedea93', '李四_综合办(lisizhb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('66d4896ef1df4cf3aa76477c7a4778a0', '李四_销售部(lisixsb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('6bec1456a19b461ba8d49aeb41d51694', '麻子_客服部(mazikfb)', '1', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('6cfb79806cb94d859dfbd5bbe2f96677', '王二_客服部(wangerkfb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('6e5b226bae1a4e8daee57bbaf14687fe', '张三_销售部(zhangsanxsb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('70fe0385b617413e9137de4be2bbfda8', '王二_成品仓(wangercpc)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('7161dccd8f3a4507a5bb081719682ffe', '张三_总经办(zhangsanzjb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('71d16d3fc54b49399934c2972ba6a77b', '王二_档案部(wangerdab)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('75c623ff633943d999651f47faac6d23', '李四_成品仓(lisicpc)', '1', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('762196b7f3ff4ed5bf68eadd1b93ffe1', '王二_设计部(wangersjb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('762bb1fa2927458f9ff0240f664225c6', '李四_IT部(lisiitb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('765d720988e446da85f54ed97cc9277d', '麻子_销售部(mazixsb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('775c81e399b6408fbb8551f165cc56c1', '王二_综合办(wangerzhb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('77c4c6f4bad74197aa9b01dfabe73ab9', '张三_档案部(zhangsandab)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('78e333d98cac4b76941b804bfbcb9179', '李四_设计部(lisisjb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('7aafa7853a324051bfd0cec110dd4559', '麻子_采购部(mazicgb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('7ca9df3c1e644459bb9c02c95b9ae760', '张三_行政部(zhangsanxzb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('7f70889bd8164b59aa7f324307a7f1ba', '张三_综合办(zhangsanzhb)', null, null, '2019-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('86db7a13f0a24b8f8453043a38b75d52', '李四_IT部(lisiitb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('89d40846a810470b860a2cfc4d55a15e', '麻子_IT部(maziitb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('91274d09f29d43b9b5e522357ef1f37a', '麻子_技术部(mazijsb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('91639cd0c830473fa565ab2d2654f430', '李四_综合办(lisizhb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('99c390c889954ef9a9d3da4d65206945', '张三_财务部(zhangsancwb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('9a42490866354f92b15419817291ca5e', '张三_销售部(zhangsanxsb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('9af4533e08374dd4ac4a4b963a4fe41e', '张三_总经办(zhangsanzjb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('9b61c600619b4e9e9031ebb38edf0e4a', '张三_档案部(zhangsandab)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('9b9649f8e2b249f7aff9290fbd6c45ef', '李四_行政部(lisixzb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('9cc280b835864becbd16940feb86dcce', '张三_物流部(zhangsanwlb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('9f68eb990c7c4076a50e70de12402d04', '张三_总经办(zhangsanzjb)', null, null, '2018-11', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('a0c1d4d2af23438594c78bf091e05e61', '张三_采购部(zhangsancgb)', '1', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('a0ef9396ddf34c28846d5b27f2933d0b', '赵洋(zhaoyang)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('a1499b4344374948aa027da06acabcef', '麻子_采购部(mazicgb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('a6323da83466438db43a472c0177b558', '张三_IT部(zhangsanitb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('a907ecbf17a34de293519499fbcde649', '麻子_综合办(mazizhb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('a91d5aa2e68945c9951d20d2ee854ab0', '麻子_成品仓(mazicpc)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('a9682122f17b4078b9f1e26b1ed05033', '张三_成品仓(zhangsancpc)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('aa4f8ec3e47b4587b88ad9336af716dc', '张三_生产部(zhangsanscb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ae74c1c3b43d405381752df3993c098a', '麻子_总经办(mazizjb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('aeb2c06f851d4f019ff3ca0b2efc2c32', '李四_行政部(lisixzb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('b02d39add7dd42b9b83456f3cb338fe5', '王二_总经办(wangerzjb)', null, null, '2019-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('b099a7f2ca7c427caa2fcd2e2f0e35f5', '张三_IT部(zhangsanitb)', null, null, '2019-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('b17c84b468744790903fad4dec409b8a', '李四_总经办(lisizjb)', null, null, '2019-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('b28ad4dac86d46059fdeeffc55894522', '张三_设备部(zhangsansbb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('b386d652ba0244b5bc9b342e79cd7a5f', '张三_行政部(zhangsanxzb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('b74b745b3b8b48c89a74b5b745eef0cf', '麻子_财务部(mazicwb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('b7d5824d9d0e4787832a11ab70fe5126', '张三_设计部(zhangsansjb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ba86e5226f244442936306a4a61d9814', '王二_技术部(wangerjsb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('bc31aceb86c147169f39e87a822b6e1c', '麻子_销售部(mazixsb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('bd0cd9d13b62457baae7fdf4594e5325', '王二_设备部(wangersbb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('c04e97237ef74cea9d56adc752bfda8a', '李四_生产部(lisiscb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('c379e27715e347dc8a8edb33efa5197d', '张三_技术部(zhangsanjsb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('c5e277e1cef34b76badd7644eafafdc4', '小明(xiaoming)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('c6074b9becee4daba39c81e00b2bf652', '麻子_生产部(maziscb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('c61077d56a8d43ae9f9d6ea01598836d', '麻子_物流部(maziwlb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ca8b85f532ac4dd4a23b1830d201eebc', '李四_客服部(lisikfb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('cc4af77e21f747a9a152ca764874bd46', '李四_总经办(lisizjb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('cfd3aa50d06d4c6696a3e0c3283db665', '王二_销售部(wangerxsb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d19391e396734ac48010930b5257fcdc', '王二_采购部(wangercgb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d439f7a3c3cc4e94a0bd85183735733e', '李四_销售部(lisixsb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d4b972dbe6c44f19a428342a3c7f682d', '王二_销售部(wangerxsb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d526bc185fb44643b8d9a9a0863768c5', '李四_技术部(lisijsb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d52f1dc560bc4a2aabc40d7edb6c7fb6', '张三_总经办(zhangsanzjb)', null, null, '2019-06', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d562c77738214e76bdf0fd4b663c0374', '麻子_行政部(mazixzb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d56ffb89390b4e8bbeef7da9e47e3542', '王二_行政部(wangerxzb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d632c56240394f018c9a39899f03fd65', '王二_财务部(wangercwb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('d6f81452baae4a48b124b26e4c59d562', '李四_设计部(lisisjb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('dbf2612aa6754548aeb42e349086163e', '麻子_客服部(mazikfb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('dd227ef00f134645a298108b637031b3', '麻子_行政部(mazixzb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e1f6e1eea3784e9d869ccfc5e3b6efff', '王二_设备部(wangersbb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e2418968ab3049fb9276ef896f674298', '麻子_技术部(mazijsb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e25f275ccad14bb9952c890dd37923fa', '张三_客服部(zhangsankfb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e4175bdc6a6e4471bce14874bed4dccf', '李四_采购部(lisicgb)', '1', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e43701d82b044c0b9dab6c34d346f286', '李四_成品仓(lisicpc)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e4c790f3567543a995957c53aa9e9088', '张三_设备部(zhangsansbb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e5fb4bfedc1c46efaccc4f0e69f4a99f', '王二_物流部(wangerwlb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('e87c53cf09894824a9290e8a05ae82cb', '麻子_综合办(mazizhb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('eaccdcd0837c400cb4f3a8e484410980', '王二_IT部(wangeritb)', '1', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ed2b845cee2b417e9d38f525315f3082', '麻子_设备部(mazisbb)', '0', '1', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ed6674204eff4186bf7e1ffc4b7b5d6b', '麻子_生产部(maziscb)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ed80c413f88a418682fc4169558eca1f', '李四_设备部(lisisbb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ed9d0c6e8d88430e883c8b2051405b5a', '张三_董事长(zhangsandsz)', '0', '1', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('ef49eb088eb44479a98f24d2b24e5360', '李四_档案部(lisidab)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('f15b39d9ec9e450494071296a14c07da', '麻子_设计部(mazisjb)', '0', '0', '2018-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('f997cef8887945fbbf392df86954acbd', '张三_总经办(zhangsanzjb)', null, null, '2019-04', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
INSERT INTO `work_duty_statistic` VALUES ('fd933a2e712e42a090820a8ed6f120d8', '张三_物流部(zhangsanwlb)', '0', '0', '2018-05', '2019-06-03 22:57:27', '2019-06-03 22:57:27');
