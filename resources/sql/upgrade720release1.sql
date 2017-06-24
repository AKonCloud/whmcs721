ALTER TABLE  `tblupgrades` ADD  `userid` INT( 10 ) NOT NULL AFTER  `id` ;
UPDATE  `tblupgrades` SET type = 'package' WHERE type != 'package' AND type != 'configoptions';
ALTER TABLE  `tblupgrades` CHANGE  `type`  `type` ENUM(  'service', 'addon', 'package',  'configoptions') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;
ALTER TABLE  `tblupgrades` ADD  `new_cycle` VARCHAR( 30 ) NOT NULL AFTER  `newvalue` ;
ALTER TABLE  `tblupgrades` ADD  `new_recurring_amount` DECIMAL( 10, 2 ) NOT NULL AFTER  `amount` ;
ALTER TABLE  `tblupgrades` ADD  `credit_amount` DECIMAL( 10, 2 ) NOT NULL AFTER  `amount` ;
ALTER TABLE  `tblupgrades` ADD  `days_remaining` INT( 4 ) NOT NULL AFTER  `credit_amount` ;
ALTER TABLE  `tblupgrades` ADD  `total_days_in_cycle` INT( 4 ) NOT NULL AFTER  `days_remaining` ;
UPDATE tblupgrades SET userid = (SELECT userid FROM tblhosting WHERE tblhosting.id = tblupgrades.relid) WHERE type='package';

-- update custom field 'bool' values to be on or empty
UPDATE `tblcustomfields` SET `adminonly` = 'on' where `adminonly` = '1';
UPDATE `tblcustomfields` SET `adminonly` = '' where `adminonly` = '0';
UPDATE `tblcustomfields` SET `required` = 'on' where `required` = '1';
UPDATE `tblcustomfields` SET `required` = '' where `required` = '0';
UPDATE `tblcustomfields` SET `showorder` = 'on' where `showorder` = '1';
UPDATE `tblcustomfields` SET `showorder` = '' where `showorder` = '0';
UPDATE `tblcustomfields` SET `showinvoice` = 'on' where `showinvoice` = '1';
UPDATE `tblcustomfields` SET `showinvoice` = '' where `showinvoice` = '0';
