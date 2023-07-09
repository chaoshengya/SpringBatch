NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION`;
CREATE TABLE `BATCH_JOB_EXECUTION` (
                                       `JOB_EXECUTION_ID` bigint NOT NULL,
                                       `VERSION` bigint DEFAULT NULL,
                                       `JOB_INSTANCE_ID` bigint DEFAULT NULL,
                                       `CREATE_TIME` datetime DEFAULT NULL,
                                       `START_TIME` datetime DEFAULT NULL,
                                       `END_TIME` datetime DEFAULT NULL,
                                       `STATUS` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                       `EXIT_CODE` varchar(2500) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                       `EXIT_MESSAGE` varchar(2500) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                       `LAST_UPDATED` datetime(6) DEFAULT NULL,
                                       `JOB_CONFIGURATION_LOCATION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                       PRIMARY KEY (`JOB_EXECUTION_ID`),
                                       KEY `JOB_INST_EXEC_FK` (`JOB_INSTANCE_ID`),
                                       CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `BATCH_JOB_INSTANCE` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION_CONTEXT
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_CONTEXT`;
CREATE TABLE `BATCH_JOB_EXECUTION_CONTEXT` (
                                               `JOB_EXECUTION_ID` bigint NOT NULL,
                                               `SHORT_CONTEXT` varchar(2500) COLLATE utf8mb4_general_ci NOT NULL,
                                               `SERIALIZED_CONTEXT` text COLLATE utf8mb4_general_ci,
                                               PRIMARY KEY (`JOB_EXECUTION_ID`),
                                               CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION_PARAMS
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_PARAMS`;
CREATE TABLE `BATCH_JOB_EXECUTION_PARAMS` (
                                              `JOB_EXECUTION_ID` bigint NOT NULL,
                                              `TYPE_CD` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
                                              `KEY_NAME` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                              `STRING_VAL` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                              `DATE_VAL` datetime(6) DEFAULT NULL,
                                              `LONG_VAL` bigint DEFAULT NULL,
                                              `DOUBLE_VAL` double DEFAULT NULL,
                                              `IDENTIFYING` char(1) COLLATE utf8mb4_general_ci NOT NULL,
                                              KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`),
                                              CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION_SEQ
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_SEQ`;
CREATE TABLE `BATCH_JOB_EXECUTION_SEQ` (
                                           `ID` bigint NOT NULL,
                                           `UNIQUE_KEY` char(1) COLLATE utf8mb4_general_ci NOT NULL,
                                           UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_JOB_INSTANCE
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_INSTANCE`;
CREATE TABLE `BATCH_JOB_INSTANCE` (
                                      `JOB_INSTANCE_ID` bigint NOT NULL,
                                      `VERSION` bigint DEFAULT NULL,
                                      `JOB_NAME` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                      `JOB_KEY` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
                                      PRIMARY KEY (`JOB_INSTANCE_ID`),
                                      UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_JOB_SEQ
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_SEQ`;
CREATE TABLE `BATCH_JOB_SEQ` (
                                 `ID` bigint NOT NULL,
                                 `UNIQUE_KEY` char(1) COLLATE utf8mb4_general_ci NOT NULL,
                                 UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_STEP_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION`;
CREATE TABLE `BATCH_STEP_EXECUTION` (
                                        `STEP_EXECUTION_ID` bigint NOT NULL,
                                        `VERSION` bigint NOT NULL,
                                        `STEP_NAME` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                        `JOB_EXECUTION_ID` bigint NOT NULL,
                                        `CREATE_TIME` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
                                        `START_TIME` datetime(3) DEFAULT NULL,
                                        `END_TIME` datetime(3) DEFAULT NULL,
                                        `STATUS` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `COMMIT_COUNT` bigint DEFAULT NULL,
                                        `READ_COUNT` bigint DEFAULT NULL,
                                        `FILTER_COUNT` bigint DEFAULT NULL,
                                        `WRITE_COUNT` bigint DEFAULT NULL,
                                        `READ_SKIP_COUNT` bigint DEFAULT NULL,
                                        `WRITE_SKIP_COUNT` bigint DEFAULT NULL,
                                        `PROCESS_SKIP_COUNT` bigint DEFAULT NULL,
                                        `ROLLBACK_COUNT` bigint DEFAULT NULL,
                                        `EXIT_CODE` varchar(2500) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `EXIT_MESSAGE` varchar(2500) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `LAST_UPDATED` datetime(6) DEFAULT NULL,
                                        PRIMARY KEY (`STEP_EXECUTION_ID`),
                                        KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`),
                                        CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_STEP_EXECUTION_CONTEXT
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION_CONTEXT`;
CREATE TABLE `BATCH_STEP_EXECUTION_CONTEXT` (
                                                `STEP_EXECUTION_ID` bigint NOT NULL,
                                                `SHORT_CONTEXT` varchar(2500) COLLATE utf8mb4_general_ci NOT NULL,
                                                `SERIALIZED_CONTEXT` text COLLATE utf8mb4_general_ci,
                                                PRIMARY KEY (`STEP_EXECUTION_ID`),
                                                CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `BATCH_STEP_EXECUTION` (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for BATCH_STEP_EXECUTION_SEQ
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION_SEQ`;
CREATE TABLE `BATCH_STEP_EXECUTION_SEQ` (
                                            `ID` bigint NOT NULL,
                                            `UNIQUE_KEY` char(1) COLLATE utf8mb4_general_ci NOT NULL,
                                            UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                              `age` int DEFAULT NULL COMMENT '年龄',
                              `name` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名字',
                              `birthday` date DEFAULT NULL COMMENT '生日',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Procedure structure for rand_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `rand_data`;
delimiter ;;
CREATE PROCEDURE `rand_data`(in num int)
begin
declare str char(62) default 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
declare str2 char(2);
declare i int default 0;
while i<num do
set str2=concat(substring(str,1+floor(rand()*61),1),substring(str,1+floor(rand()*61),1));
set i=i+1;
insert into tb_student(name,age,birthday) values (str2,floor(rand()*num),CURDATE());
end while;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO BATCH_JOB_SEQ (ID, UNIQUE_KEY) select * from (select 0 as ID, '0' as UNIQUE_KEY) as tmp where not exists(select * from BATCH_JOB_SEQ);

INSERT INTO BATCH_JOB_EXECUTION_SEQ (ID, UNIQUE_KEY) select * from (select 0 as ID, '0' as UNIQUE_KEY) as tmp where not exists(select * from BATCH_JOB_EXECUTION_SEQ);

INSERT INTO BATCH_STEP_EXECUTION_SEQ (ID, UNIQUE_KEY) select * from (select 0 as ID, '0' as UNIQUE_KEY) as tmp where not exists(select * from BATCH_STEP_EXECUTION_SEQ);