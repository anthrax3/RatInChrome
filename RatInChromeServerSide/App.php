<?php


class RatInChromeApp {

    private static $connection = null;
    private static $secret = "r=PM.%{>x4mh0-S5";

    public static function getDbConnection () {
        if (!self::$connection) {
            //Инициализаций подключения к БД
            self::$connection = new mysqli("127.0.0.1", "root", "Step1993", "log_db");
            if (self::$connection->connect_errno) {
            	error_log(self::$connection->connect_error);
                die();
            }
            self::$connection->query("SET NAMES utf8;");
        }
        return self::$connection;
    }

    public static function get_secret() {
        return self::$secret;
    }
}
