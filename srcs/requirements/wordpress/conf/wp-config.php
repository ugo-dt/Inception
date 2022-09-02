<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define("DB_NAME",				getenv("MARIADB_DATABASE"));

/** Database username */
define("DB_USER",				getenv("MARIADB_USER"));

/** Database password */
define("DB_PASSWORD",			getenv("MARIADB_PASSWORD"));

/** Database hostname */
define("DB_HOST",				getenv("WORDPRESS_MARIADB_HOST") . ":3306");

/** Database charset to use in creating database tables. */
define("DB_CHARSET",			getenv("MARIADB_CHARSET"));

/** The database collate type. Don't change this if in doubt. */
define("DB_COLLATE",			getenv("MARIADB_COLLATE"));

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',				'2>#Zc9]> ChGj2`rJX++n{ /~Jc)ha^j1:EX(n_oj&.jMbSy--5qpPcUX9bs$F_I');
define('SECURE_AUTH_KEY',		'PN/_MlG:%[*`cgsWc!VnkU6&^K$A6$%+|sGrBf9F)SRmq]^-[$#Roi#-#ir.;;/Z');
define('LOGGED_IN_KEY',			'&v06[Qp!`s/+|m<]dWL5H{q>9iWA`I5p1A@Bsugm`b?g|y#O-arA_/ee*wE`m%$x');
define('NONCE_KEY',				'OGip0)Z{dB|fRKA<Z&0Pd8#]+E).qRrA!*zu>h8o!;O+VX#.6KK=vJ5-I,[+.KT+');
define('AUTH_SALT',				'(|c,Cfq`gzz_A;We|Q! e-v.7&xXw`wzy?2IR;o.gagd71w<?Sj{^?&)M}+|c-vj');
define('SECURE_AUTH_SALT',		'h`Q}eo(h,AgN{C vqu4RU@/}O,,JUQP,8h8^W7pg+g|@17&5J&d!+,Y6jVp@/! 2');
define('LOGGED_IN_SALT',		'gr18NT+Ec2|+vs2bk` w1[/7 FeX_3WWbWBh|MX+;N#,N(L.4NM=u;x1`*nO,a_5');
define('NONCE_SALT',			'MDg{iGuQ1=OWbAMsVS*?OU_Icxc~FL8|e`]vb-ODU--w*;}/}i-;ZS9M@BXVc(qd');
define("CONCATENATE_SCRIPTS",	false);

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix =					getenv("MARIADB_PREFIX");

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define("WP_DEBUG", true);

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if (!defined("ABSPATH"))
	define("ABSPATH", __DIR__ . "/");

/** Sets up WordPress vars and included files. */
require_once ABSPATH . "wp-settings.php";
