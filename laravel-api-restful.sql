-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 31 mars 2022 à 15:04
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel-api-restful`
--

-- --------------------------------------------------------

--
-- Structure de la table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visibility` set('non','oui') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parent_id`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 'Wordpress', 'Contiens tous les documents de Wordpress', NULL, 'oui', NULL, NULL),
(2, 'Ma Presse Locale', 'Contiens tous les documents de Ma Presse Locale', NULL, 'oui', NULL, NULL),
(3, 'Centre de ressources', 'Contiens tous les documents du centre de ressources', NULL, 'oui', NULL, NULL),
(4, 'Partage', NULL, NULL, 'non', '2022-03-12 14:15:28', '2022-03-12 14:15:28');

-- --------------------------------------------------------

--
-- Structure de la table `category_documentation`
--

CREATE TABLE `category_documentation` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `documentation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_documentation`
--

INSERT INTO `category_documentation` (`category_id`, `documentation_id`) VALUES
(2, 1),
(3, 1),
(2, 2),
(1, 3),
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 5),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 6),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 7),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 10),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 11),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'parent_id', 'select_dropdown', 'Parent Id', 0, 1, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 4),
(26, 4, 'visibility', 'select_dropdown', 'Visibility', 1, 1, 1, 1, 1, 1, '{\"default\":\"non\",\"options\":{\"non\":\"non\",\"oui\":\"oui\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(31, 6, 'url', 'text', 'Url', 1, 1, 1, 1, 1, 1, '{}', 3),
(32, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(33, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(34, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(35, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(36, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(37, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(38, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(39, 8, 'author_id', 'select_dropdown', 'Author Id', 1, 1, 0, 1, 1, 0, '{\"default\":\"1\",\"options\":{\"\":\"1\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 8),
(40, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(41, 8, 'slug', 'text', 'Slug', 1, 0, 0, 1, 1, 0, '{\"slugify\":{\"origin\":\"title\"}}', 4),
(42, 8, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(43, 8, 'exerpt', 'text', 'Exerpt', 0, 1, 1, 1, 1, 1, '{}', 5),
(44, 8, 'content', 'rich_text_box', 'Content', 1, 1, 1, 1, 1, 1, '{}', 6),
(45, 8, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"publier\",\"DRAFT\":\"brouillon\",\"PENDING\":\"en attente\"}}', 7),
(46, 8, 'meta', 'text', 'Meta', 0, 0, 0, 0, 0, 0, '{}', 9),
(47, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 13),
(48, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(50, 8, 'documentation_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\category\",\"table\":\"categories\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"category_documentation\",\"pivot\":\"1\",\"taggable\":\"0\"}', 10),
(53, 8, 'documentation_belongstomany_site_relationship', 'relationship', 'sites', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Site\",\"table\":\"sites\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"documentation_site\",\"pivot\":\"1\",\"taggable\":\"0\"}', 15),
(54, 8, 'documentation_belongstomany_tag_relationship', 'relationship', 'tags', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"documentation_tag\",\"pivot\":\"1\",\"taggable\":null}', 16),
(55, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(56, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(57, 9, 'url', 'file', 'Url', 1, 1, 1, 1, 1, 1, '{}', 3),
(58, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(59, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(61, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(62, 10, 'question', 'text', 'Question', 1, 1, 1, 1, 1, 1, '{}', 3),
(63, 10, 'response', 'text', 'Response', 1, 1, 1, 1, 1, 1, '{}', 4),
(64, 10, 'doc_id', 'text', 'Doc Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(65, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(66, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(67, 10, 'faq_belongsto_documentation_relationship', 'relationship', 'documentations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Documentation\",\"table\":\"documentations\",\"type\":\"belongsTo\",\"column\":\"doc_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"blogs\",\"pivot\":\"0\",\"taggable\":null}', 7),
(69, 9, 'document_belongstomany_site_relationship', 'relationship', 'sites', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Site\",\"table\":\"sites\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"document_site\",\"pivot\":\"1\",\"taggable\":null}', 7),
(70, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 8),
(71, 1, 'post', 'text', 'Post', 0, 1, 1, 1, 1, 1, '{}', 4);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-03-12 11:37:55', '2022-03-31 13:04:12'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'App\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-03-12 14:05:36', '2022-03-12 14:15:48'),
(6, 'sites', 'sites', 'Site', 'Sites', 'voyager-browser', 'App\\Models\\Site', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-03-12 14:08:44', '2022-03-12 14:08:44'),
(7, 'tags', 'tags', 'Tag', 'Tags', 'voyager-tag', 'App\\Models\\Tag', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-03-12 14:10:15', '2022-03-12 14:10:40'),
(8, 'documentations', 'documentations', 'Documentation', 'Documentations', 'voyager-receipt', 'App\\Models\\Documentation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-03-12 14:14:44', '2022-03-24 09:43:03'),
(9, 'documents', 'documents', 'Document', 'Documents', 'voyager-file-text', 'App\\Models\\Document', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-03-24 18:53:35', '2022-03-24 19:01:53'),
(10, 'faqs', 'faqs', 'Faq', 'Faqs', 'voyager-question', 'App\\Models\\Faq', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-03-24 18:56:32', '2022-03-24 18:56:32');

-- --------------------------------------------------------

--
-- Structure de la table `documentations`
--

CREATE TABLE `documentations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exerpt` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `meta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `documentations`
--

INSERT INTO `documentations` (`id`, `author_id`, `image`, `slug`, `title`, `exerpt`, `content`, `status`, `meta`, `created_at`, `updated_at`) VALUES
(1, 1, 'documentations/March2022/MHAru03eW0anQTuXv5PD.jpeg', 'test-petite-description', 'test petite description', 'test petite description', '<p>test petite descriptiontest petite descriptiontest petite descriptiontest petite descriptiontest petite description</p>\r\n<p>test petite descriptiontest petite description</p>\r\n<p>test petite descriptiontest petite description</p>\r\n<p>test petite descriptiontest petite description</p>\r\n<p>test petite descriptiontest petite description</p>\r\n<p>test petite description</p>\r\n<p><img src=\"http://localhost:8000/storage/documentations/March2022/carte-france-idf.png\" alt=\"\" width=\"162\" height=\"182\" />&nbsp;test petite description test petite description</p>', 'PUBLISHED', NULL, '2022-03-12 15:55:00', '2022-03-12 16:07:45'),
(2, 1, 'documentations/March2022/WC52ObfUk6ZPDiVdc9Pu.png', 'test-ajout-de-dumentation', 'test ajout de dumentation', 'ceci est une petite description', '<div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<p style=\"margin: 0px 0px 15px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in orci a diam dictum sollicitudin. Nulla vel magna id nunc feugiat cursus sit amet eu eros. Fusce iaculis auctor efficitur. Fusce non urna et orci iaculis lacinia feugiat sed tortor. Morbi vulputate, risus sed facilisis placerat, ipsum sem lobortis odio, in pellentesque dolor arcu sed neque. Curabitur in pulvinar sapien. Cras vitae dolor vel nibh sollicitudin imperdiet. Integer nec nulla tristique, dignissim erat sit amet, fermentum mauris.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px;\">Vivamus blandit tellus imperdiet, luctus ligula quis, finibus lorem. Donec auctor posuere magna, in bibendum tortor vehicula eu. Praesent commodo nec nulla in facilisis. Mauris vel condimentum felis. Nulla elementum nisi nulla, et tincidunt neque iaculis sit amet. Nam vel lobortis leo, at fermentum ex. Aenean euismod velit nec imperdiet euismod. Praesent bibendum, est eget vulputate convallis, eros diam efficitur nunc, in tempor tortor lorem id metus. Nunc suscipit lobortis faucibus. Fusce feugiat leo a mattis semper.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px;\">Phasellus eget egestas urna. Sed id libero sit amet diam suscipit hendrerit vel a libero. Etiam bibendum massa ante, tincidunt pulvinar enim vulputate egestas. Fusce elementum, lorem at convallis maximus, odio metus finibus erat, non consectetur nunc ligula vel dui. Aliquam tincidunt velit id porttitor tristique. Nam tempor augue sed imperdiet auctor. Morbi tincidunt risus et massa ornare luctus. Aenean vitae sem ex. Vestibulum viverra ultrices dolor, a imperdiet leo dictum non. Nam aliquam ex ut viverra facilisis. Suspendisse potenti. Suspendisse in molestie ligula. Morbi consectetur, elit in pretium suscipit, neque nulla elementum nunc, laoreet volutpat libero dolor at quam. Nullam quis accumsan sem.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px;\">Phasellus in nisi sit amet turpis condimentum viverra. Curabitur et ligula massa. Etiam in auctor urna. Nam quis magna ac elit vestibulum congue. Quisque sit amet aliquet libero. Vestibulum pretium vestibulum posuere. Donec aliquam condimentum cursus. Aliquam lacinia sit amet metus mollis convallis. Proin varius finibus lorem, dictum molestie leo faucibus ut. Nunc faucibus metus a tempor tincidunt. Vivamus condimentum tincidunt tincidunt.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px;\">Morbi ultrices neque non leo placerat, et pretium odio ullamcorper. Nullam sit amet laoreet quam, sed viverra leo. Donec semper risus massa, ut imperdiet neque rutrum non. Integer quis dapibus dolor, ut scelerisque tortor. Fusce nec dictum ante, quis aliquam velit. Aliquam erat volutpat. Mauris tincidunt eros sed eros congue, in fermentum ex pulvinar. Sed dignissim gravida lectus, id finibus metus mattis vitae. Quisque est dolor, consequat vitae urna a, sagittis hendrerit sapien. Mauris maximus scelerisque nulla, ut accumsan velit mollis eget.</p>\r\n<p>&nbsp;</p>\r\n</div>', 'PUBLISHED', NULL, '2022-03-21 09:09:03', '2022-03-21 09:09:21'),
(3, 1, 'documentations/March2022/QKnn5JV58Ve4rnIkLxHZ.jpeg', 'test-documentation', 'test documentation', 'je suis la petite description', '<p>je stock un peu de code pour voir</p>\r\n<p>&nbsp;</p>\r\n<div style=\"color: #d4d4d4; background-color: #1e1e1e; font-family: Menlo, Monaco, \'Courier New\', monospace; font-size: 12px; line-height: 18px; white-space: pre;\">\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">index</span>(<span style=\"color: #4ec9b0;\">Request</span> <span style=\"color: #9cdcfe;\">$request</span>)</div>\r\n<div>{</div>\r\n<div>&nbsp;</div>\r\n<div>}</div>\r\n<br />\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">list_documentations</span>(<span style=\"color: #4ec9b0;\">Request</span> <span style=\"color: #9cdcfe;\">$request</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$input</span> = <span style=\"color: #9cdcfe;\">$request</span>;</div>\r\n<div><span style=\"color: #9cdcfe;\">$host</span> = <span style=\"color: #9cdcfe;\">$input</span>[<span style=\"color: #ce9178;\">\'host\'</span>];</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span> = [];</div>\r\n<div><span style=\"color: #9cdcfe;\">$siteInfos</span> = <span style=\"color: #4ec9b0;\">DB</span>::<span style=\"color: #dcdcaa;\">table</span>(<span style=\"color: #ce9178;\">\'sites\'</span>)-&gt;<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'url\'</span>, <span style=\"color: #ce9178;\">\'LIKE\'</span>, <span style=\"color: #ce9178;\">\"%{</span><span style=\"color: #9cdcfe;\">$host</span><span style=\"color: #ce9178;\">}%\"</span>)-&gt;<span style=\"color: #dcdcaa;\">first</span>();</div>\r\n<div><span style=\"color: #c586c0;\">if</span> (<span style=\"color: #dcdcaa;\">is_null</span>(<span style=\"color: #9cdcfe;\">$siteInfos</span>)) {</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #ce9178;\">\'Documentations does not exist.\'</span>);</div>\r\n<div>}</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentationsPivot</span> = <span style=\"color: #ce9178;\">\"\"</span>;</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentationsPivot</span> = <span style=\"color: #4ec9b0;\">DB</span>::<span style=\"color: #dcdcaa;\">table</span>(<span style=\"color: #ce9178;\">\'site_documentation\'</span>)-&gt;<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'site_id\'</span>, <span style=\"color: #9cdcfe;\">$siteInfos</span>-&gt;<span style=\"color: #9cdcfe;\">id</span>)-&gt;<span style=\"color: #dcdcaa;\">get</span>();</div>\r\n<div><span style=\"color: #c586c0;\">if</span> (<span style=\"color: #dcdcaa;\">is_null</span>(<span style=\"color: #9cdcfe;\">$documentationsPivot</span>)) {</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #ce9178;\">\'Documentations does not exist.\'</span>);</div>\r\n<div>}</div>\r\n<br /><br /><br />\r\n<div><span style=\"color: #c586c0;\">foreach</span>( <span style=\"color: #9cdcfe;\">$documentationsPivot</span> as <span style=\"color: #9cdcfe;\">$key</span> =&gt; <span style=\"color: #9cdcfe;\">$item</span>){</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span> = <span style=\"color: #4ec9b0;\">Documentation</span>::<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'id\'</span>, <span style=\"color: #9cdcfe;\">$item</span>-&gt;<span style=\"color: #9cdcfe;\">documentation_id</span>)-&gt;<span style=\"color: #dcdcaa;\">get</span>();</div>\r\n<div>}</div>\r\n<div><span style=\"color: #c586c0;\">if</span> (<span style=\"color: #dcdcaa;\">is_null</span>(<span style=\"color: #9cdcfe;\">$documentations</span>)) {</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #ce9178;\">\'Documentations does not exist.\'</span>);</div>\r\n<div>}</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>(<span style=\"color: #9cdcfe;\">$documentations</span>, <span style=\"color: #ce9178;\">\'Post fetched.\'</span>);</div>\r\n<div>}</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">store</span>(<span style=\"color: #4ec9b0;\">Request</span> <span style=\"color: #9cdcfe;\">$request</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$input</span> = <span style=\"color: #9cdcfe;\">$request</span>-&gt;<span style=\"color: #dcdcaa;\">all</span>();</div>\r\n<div><span style=\"color: #9cdcfe;\">$validator</span> = <span style=\"color: #4ec9b0;\">Validator</span>::<span style=\"color: #dcdcaa;\">make</span>(<span style=\"color: #9cdcfe;\">$input</span>, [</div>\r\n<div><span style=\"color: #ce9178;\">\'title\'</span> =&gt; <span style=\"color: #ce9178;\">\'required\'</span>,</div>\r\n<div><span style=\"color: #ce9178;\">\'description\'</span> =&gt; <span style=\"color: #ce9178;\">\'required\'</span></div>\r\n<div>]);</div>\r\n<div><span style=\"color: #c586c0;\">if</span>(<span style=\"color: #9cdcfe;\">$validator</span>-&gt;<span style=\"color: #dcdcaa;\">fails</span>()){</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #9cdcfe;\">$validator</span>-&gt;<span style=\"color: #dcdcaa;\">errors</span>());</div>\r\n<div>}</div>\r\n<div><span style=\"color: #9cdcfe;\">$blog</span> = <span style=\"color: #4ec9b0;\">Documentation</span>::<span style=\"color: #dcdcaa;\">create</span>(<span style=\"color: #9cdcfe;\">$input</span>);</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>(<span style=\"color: #569cd6;\">new</span> <span style=\"color: #4ec9b0;\">ResourcesDocumentation</span>(<span style=\"color: #9cdcfe;\">$blog</span>), <span style=\"color: #ce9178;\">\'Post created.\'</span>);</div>\r\n<div>}</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">show</span>(<span style=\"color: #9cdcfe;\">$id</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$Category</span> = <span style=\"color: #4ec9b0;\">Documentation</span>::<span style=\"color: #dcdcaa;\">find</span>(<span style=\"color: #9cdcfe;\">$id</span>);</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #c586c0;\">if</span> (<span style=\"color: #dcdcaa;\">is_null</span>(<span style=\"color: #9cdcfe;\">$Category</span>)) {</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #ce9178;\">\'Post does not exist.\'</span>);</div>\r\n<div>}</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>(<span style=\"color: #569cd6;\">new</span> <span style=\"color: #4ec9b0;\">ResourcesDocumentation</span>(<span style=\"color: #9cdcfe;\">$Category</span>), <span style=\"color: #ce9178;\">\'Post fetched.\'</span>);</div>\r\n<div>}</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">update</span>(<span style=\"color: #4ec9b0;\">Request</span> <span style=\"color: #9cdcfe;\">$request</span>, <span style=\"color: #4ec9b0;\">Documentation</span> <span style=\"color: #9cdcfe;\">$Documentation</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$input</span> = <span style=\"color: #9cdcfe;\">$request</span>-&gt;<span style=\"color: #dcdcaa;\">all</span>();</div>\r\n<div><span style=\"color: #9cdcfe;\">$validator</span> = <span style=\"color: #4ec9b0;\">Validator</span>::<span style=\"color: #dcdcaa;\">make</span>(<span style=\"color: #9cdcfe;\">$input</span>, [</div>\r\n<div><span style=\"color: #ce9178;\">\'title\'</span> =&gt; <span style=\"color: #ce9178;\">\'required\'</span>,</div>\r\n<div><span style=\"color: #ce9178;\">\'description\'</span> =&gt; <span style=\"color: #ce9178;\">\'required\'</span></div>\r\n<div>]);</div>\r\n<div><span style=\"color: #c586c0;\">if</span>(<span style=\"color: #9cdcfe;\">$validator</span>-&gt;<span style=\"color: #dcdcaa;\">fails</span>()){</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #9cdcfe;\">$validator</span>-&gt;<span style=\"color: #dcdcaa;\">errors</span>());</div>\r\n<div>}</div>\r\n<div><span style=\"color: #9cdcfe;\">$Documentation</span>-&gt;<span style=\"color: #9cdcfe;\">title</span> = <span style=\"color: #9cdcfe;\">$input</span>[<span style=\"color: #ce9178;\">\'title\'</span>];</div>\r\n<div><span style=\"color: #9cdcfe;\">$Documentation</span>-&gt;<span style=\"color: #9cdcfe;\">description</span> = <span style=\"color: #9cdcfe;\">$input</span>[<span style=\"color: #ce9178;\">\'description\'</span>];</div>\r\n<div><span style=\"color: #9cdcfe;\">$Documentation</span>-&gt;<span style=\"color: #dcdcaa;\">save</span>();</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>(<span style=\"color: #569cd6;\">new</span> <span style=\"color: #4ec9b0;\">ResourcesDocumentation</span>(<span style=\"color: #9cdcfe;\">$Documentation</span>), <span style=\"color: #ce9178;\">\'Post updated.\'</span>);</div>\r\n<div>}</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">destroy</span>(<span style=\"color: #4ec9b0;\">Documentation</span> <span style=\"color: #9cdcfe;\">$Documentation</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$Documentation</span>-&gt;<span style=\"color: #dcdcaa;\">delete</span>();</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>([], <span style=\"color: #ce9178;\">\'Post deleted.\'</span>);</div>\r\n<div>}</div>\r\n<br /><br /><br /><br />\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">get_documentations_category</span>(<span style=\"color: #9cdcfe;\">$id</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span> = [];</div>\r\n<br />\r\n<div><span style=\"color: #9cdcfe;\">$documentationsPivot</span> = <span style=\"color: #4ec9b0;\">DB</span>::<span style=\"color: #dcdcaa;\">table</span>(<span style=\"color: #ce9178;\">\'category_documentation\'</span>)-&gt;<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'category_id\'</span>, <span style=\"color: #9cdcfe;\">$id</span>)-&gt;<span style=\"color: #dcdcaa;\">get</span>();</div>\r\n<br />\r\n<div><span style=\"color: #c586c0;\">foreach</span>(<span style=\"color: #9cdcfe;\">$documentationsPivot</span> as <span style=\"color: #9cdcfe;\">$key</span> =&gt; <span style=\"color: #9cdcfe;\">$item</span>){</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span>[<span style=\"color: #9cdcfe;\">$key</span>] = <span style=\"color: #4ec9b0;\">Documentation</span>::<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'id\'</span>, <span style=\"color: #9cdcfe;\">$item</span>-&gt;<span style=\"color: #9cdcfe;\">documentation_id</span>)-&gt;<span style=\"color: #dcdcaa;\">get</span>();</div>\r\n<div>}</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #c586c0;\">if</span> (<span style=\"color: #dcdcaa;\">is_null</span>(<span style=\"color: #9cdcfe;\">$documentations</span>)) {</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #ce9178;\">\'Documentations does not exist.\'</span>);</div>\r\n<div>}</div>\r\n<br /><br />\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>(<span style=\"color: #9cdcfe;\">$documentations</span>, <span style=\"color: #ce9178;\">\'Post fetched.\'</span>);</div>\r\n<div>}</div>\r\n<br /><br /><br /><br /><br />\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">get_documentations_tag</span>(<span style=\"color: #9cdcfe;\">$id</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span> = [];</div>\r\n<br />\r\n<div><span style=\"color: #9cdcfe;\">$documentationsPivot</span> = <span style=\"color: #4ec9b0;\">DB</span>::<span style=\"color: #dcdcaa;\">table</span>(<span style=\"color: #ce9178;\">\'tag_documentation\'</span>)-&gt;<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'tag_id\'</span>, <span style=\"color: #9cdcfe;\">$id</span>)-&gt;<span style=\"color: #dcdcaa;\">get</span>();</div>\r\n<br />\r\n<div><span style=\"color: #c586c0;\">foreach</span>(<span style=\"color: #9cdcfe;\">$documentationsPivot</span> as <span style=\"color: #9cdcfe;\">$key</span> =&gt; <span style=\"color: #9cdcfe;\">$item</span>){</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span>[<span style=\"color: #9cdcfe;\">$key</span>] = <span style=\"color: #4ec9b0;\">Documentation</span>::<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'id\'</span>, <span style=\"color: #9cdcfe;\">$item</span>-&gt;<span style=\"color: #9cdcfe;\">documentation_id</span>)-&gt;<span style=\"color: #dcdcaa;\">get</span>();</div>\r\n<div>}</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #c586c0;\">if</span> (<span style=\"color: #dcdcaa;\">is_null</span>(<span style=\"color: #9cdcfe;\">$documentations</span>)) {</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #ce9178;\">\'Documentations does not exist.\'</span>);</div>\r\n<div>}</div>\r\n<br /><br />\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>(<span style=\"color: #9cdcfe;\">$documentations</span>, <span style=\"color: #ce9178;\">\'Post fetched.\'</span>);</div>\r\n<div>}</div>\r\n<br /><br />\r\n<div><span style=\"color: #569cd6;\">public</span> <span style=\"color: #569cd6;\">function</span> <span style=\"color: #dcdcaa;\">search_documentations</span>(<span style=\"color: #9cdcfe;\">$searchTerm</span>)</div>\r\n<div>{</div>\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span> = [];</div>\r\n<br />\r\n<div><span style=\"color: #9cdcfe;\">$documentations</span> = <span style=\"color: #4ec9b0;\">Documentation</span>::<span style=\"color: #dcdcaa;\">where</span>(<span style=\"color: #ce9178;\">\'title\'</span>, <span style=\"color: #ce9178;\">\'LIKE\'</span>, <span style=\"color: #ce9178;\">\"%{</span><span style=\"color: #9cdcfe;\">$searchTerm</span><span style=\"color: #ce9178;\">}%\"</span>)-&gt;<span style=\"color: #dcdcaa;\">orWhere</span>(<span style=\"color: #ce9178;\">\'exerpt\'</span>, <span style=\"color: #ce9178;\">\'LIKE\'</span>, <span style=\"color: #ce9178;\">\"%{</span><span style=\"color: #9cdcfe;\">$searchTerm</span><span style=\"color: #ce9178;\">}%\"</span>)-&gt;<span style=\"color: #dcdcaa;\">orWhere</span>(<span style=\"color: #ce9178;\">\'content\'</span>, <span style=\"color: #ce9178;\">\'LIKE\'</span>, <span style=\"color: #ce9178;\">\"%{</span><span style=\"color: #9cdcfe;\">$searchTerm</span><span style=\"color: #ce9178;\">}%\"</span>)-&gt;<span style=\"color: #dcdcaa;\">get</span>();</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"color: #c586c0;\">if</span> (<span style=\"color: #dcdcaa;\">is_null</span>(<span style=\"color: #9cdcfe;\">$documentations</span>)) {</div>\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendError</span>(<span style=\"color: #ce9178;\">\'Documentations does not exist.\'</span>);</div>\r\n<div>}</div>\r\n<br /><br />\r\n<div><span style=\"color: #c586c0;\">return</span> <span style=\"color: #569cd6;\">$this</span>-&gt;<span style=\"color: #dcdcaa;\">sendResponse</span>(<span style=\"color: #9cdcfe;\">$documentations</span>, <span style=\"color: #ce9178;\">\'Post fetched.\'</span>);</div>\r\n<div>}</div>\r\n</div>', 'PUBLISHED', NULL, '2022-03-24 06:33:55', '2022-03-24 06:33:55');

-- --------------------------------------------------------

--
-- Structure de la table `documentation_site`
--

CREATE TABLE `documentation_site` (
  `site_id` bigint(20) UNSIGNED NOT NULL,
  `documentation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `documentation_site`
--

INSERT INTO `documentation_site` (`site_id`, `documentation_id`) VALUES
(4, 3),
(4, 2),
(13, 1),
(13, 2);

-- --------------------------------------------------------

--
-- Structure de la table `documentation_tag`
--

CREATE TABLE `documentation_tag` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `documentation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `documentation_tag`
--

INSERT INTO `documentation_tag` (`tag_id`, `documentation_id`) VALUES
(1, 1),
(3, 1),
(1, 2),
(2, 2),
(4, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'test ajout PDF', '[{\"download_link\":\"documents\\/March2022\\/ZUnCwAYUBgPEo3igvqnu.pdf\",\"original_name\":\"Avenant n\\u00b0 5 DUE CMC 01.01.2022.pdf\"}]', '2022-03-24 19:03:41', '2022-03-24 19:03:41'),
(2, 'ajout pdf 2', '[{\"download_link\":\"documents\\/March2022\\/6nUfPAOrpxqGL34mYUrH.pdf\",\"original_name\":\"billing_invoices_8a1293cf7e9a478d017eb6a4a82a67fe.pdf\"}]', '2022-03-24 19:04:14', '2022-03-24 19:04:14');

-- --------------------------------------------------------

--
-- Structure de la table `document_site`
--

CREATE TABLE `document_site` (
  `site_id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `document_site`
--

INSERT INTO `document_site` (`site_id`, `document_id`) VALUES
(13, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `response`, `doc_id`, `created_at`, `updated_at`) VALUES
(1, 'je suis une question?', 'je suis la réponse', 1, '2022-03-24 18:57:59', '2022-03-24 18:57:59'),
(2, 'j\'ai une question depuis le plugin', NULL, 1, '2022-03-24 18:58:59', '2022-03-24 18:58:59');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `index_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-03-12 11:37:55', '2022-03-12 11:37:55');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Tableau de bord', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2022-03-12 11:37:55', '2022-03-12 14:19:34', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 7, '2022-03-12 11:37:55', '2022-03-24 18:57:20', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', '#000000', 12, 2, '2022-03-12 11:37:55', '2022-03-12 14:11:08', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 12, 3, '2022-03-12 11:37:55', '2022-03-12 14:11:08', 'voyager.roles.index', NULL),
(5, 1, 'Outils', '', '_self', 'voyager-tools', '#000000', NULL, 9, '2022-03-12 11:37:55', '2022-03-24 18:57:34', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-03-12 11:37:55', '2022-03-12 14:06:27', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-03-12 11:37:55', '2022-03-12 14:06:27', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-03-12 11:37:55', '2022-03-12 14:06:27', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-03-12 11:37:55', '2022-03-12 14:06:27', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2022-03-12 11:37:55', '2022-03-24 18:57:20', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', '#000000', NULL, 5, '2022-03-12 14:05:36', '2022-03-24 18:57:25', 'voyager.categories.index', 'null'),
(12, 1, 'Comptes', '', '_self', 'voyager-person', '#000000', NULL, 8, '2022-03-12 14:06:35', '2022-03-24 18:57:20', NULL, ''),
(13, 1, 'Sites', '', '_self', 'voyager-browser', NULL, 12, 1, '2022-03-12 14:08:44', '2022-03-12 14:11:08', 'voyager.sites.index', NULL),
(14, 1, 'Tags', '', '_self', 'voyager-tag', '#000000', NULL, 6, '2022-03-12 14:10:15', '2022-03-24 18:57:25', 'voyager.tags.index', 'null'),
(15, 1, 'Documentations', '', '_self', 'voyager-receipt', NULL, NULL, 2, '2022-03-12 14:14:44', '2022-03-24 18:55:46', 'voyager.documentations.index', NULL),
(16, 1, 'Documents', '', '_self', 'voyager-file-text', '#000000', NULL, 4, '2022-03-24 18:53:35', '2022-03-24 18:57:25', 'voyager.documents.index', 'null'),
(17, 1, 'Faqs', '', '_self', 'voyager-question', NULL, NULL, 3, '2022-03-24 18:56:32', '2022-03-24 18:57:25', 'voyager.faqs.index', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(34, '2014_10_12_000000_create_users_table', 1),
(35, '2014_10_12_100000_create_password_resets_table', 1),
(36, '2019_08_19_000000_create_failed_jobs_table', 1),
(37, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(38, '2022_03_09_100000_create_categories_table', 1),
(39, '2022_03_09_144846_create_tags_table', 1),
(40, '2022_03_09_175124_create_sites_table', 1),
(41, '2022_03_10_120000_create_documentations_table', 1),
(42, '2022_03_10_151905_create_logs_table', 1),
(43, '2022_03_11_181848_pivot', 1),
(44, '2022_03_11_195803_create_faqs_table', 1),
(45, '2016_01_01_000000_add_voyager_user_fields', 2),
(46, '2016_01_01_000000_create_data_types_table', 2),
(47, '2016_05_19_173453_create_menu_table', 2),
(48, '2016_10_21_190000_create_roles_table', 2),
(49, '2016_10_21_190000_create_settings_table', 2),
(50, '2016_11_30_135954_create_permission_table', 2),
(51, '2016_11_30_141208_create_permission_role_table', 2),
(52, '2016_12_26_201236_data_types__add__server_side', 2),
(53, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(54, '2017_01_14_005015_create_translations_table', 2),
(55, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(56, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(57, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(58, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(59, '2017_08_05_000000_add_group_to_settings_table', 2),
(60, '2017_11_26_013050_add_user_role_relationship', 2),
(61, '2017_11_26_015000_create_user_roles_table', 2),
(62, '2018_03_11_000000_add_user_settings', 2),
(63, '2018_03_14_000000_add_details_to_data_types_table', 2),
(64, '2018_03_16_000000_make_settings_value_nullable', 2),
(65, '2022_03_22_122628_create_blogs_table', 3),
(66, '2022_03_11_181827_create_documents', 4);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(2, 'browse_bread', NULL, '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(3, 'browse_database', NULL, '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(4, 'browse_media', NULL, '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(5, 'browse_compass', NULL, '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(6, 'browse_menus', 'menus', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(7, 'read_menus', 'menus', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(8, 'edit_menus', 'menus', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(9, 'add_menus', 'menus', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(10, 'delete_menus', 'menus', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(11, 'browse_roles', 'roles', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(12, 'read_roles', 'roles', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(13, 'edit_roles', 'roles', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(14, 'add_roles', 'roles', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(15, 'delete_roles', 'roles', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(16, 'browse_users', 'users', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(17, 'read_users', 'users', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(18, 'edit_users', 'users', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(19, 'add_users', 'users', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(20, 'delete_users', 'users', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(21, 'browse_settings', 'settings', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(22, 'read_settings', 'settings', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(23, 'edit_settings', 'settings', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(24, 'add_settings', 'settings', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(25, 'delete_settings', 'settings', '2022-03-12 11:37:55', '2022-03-12 11:37:55'),
(26, 'browse_categories', 'categories', '2022-03-12 14:05:36', '2022-03-12 14:05:36'),
(27, 'read_categories', 'categories', '2022-03-12 14:05:36', '2022-03-12 14:05:36'),
(28, 'edit_categories', 'categories', '2022-03-12 14:05:36', '2022-03-12 14:05:36'),
(29, 'add_categories', 'categories', '2022-03-12 14:05:36', '2022-03-12 14:05:36'),
(30, 'delete_categories', 'categories', '2022-03-12 14:05:36', '2022-03-12 14:05:36'),
(31, 'browse_sites', 'sites', '2022-03-12 14:08:44', '2022-03-12 14:08:44'),
(32, 'read_sites', 'sites', '2022-03-12 14:08:44', '2022-03-12 14:08:44'),
(33, 'edit_sites', 'sites', '2022-03-12 14:08:44', '2022-03-12 14:08:44'),
(34, 'add_sites', 'sites', '2022-03-12 14:08:44', '2022-03-12 14:08:44'),
(35, 'delete_sites', 'sites', '2022-03-12 14:08:44', '2022-03-12 14:08:44'),
(36, 'browse_tags', 'tags', '2022-03-12 14:10:15', '2022-03-12 14:10:15'),
(37, 'read_tags', 'tags', '2022-03-12 14:10:15', '2022-03-12 14:10:15'),
(38, 'edit_tags', 'tags', '2022-03-12 14:10:15', '2022-03-12 14:10:15'),
(39, 'add_tags', 'tags', '2022-03-12 14:10:15', '2022-03-12 14:10:15'),
(40, 'delete_tags', 'tags', '2022-03-12 14:10:15', '2022-03-12 14:10:15'),
(41, 'browse_documentations', 'documentations', '2022-03-12 14:14:44', '2022-03-12 14:14:44'),
(42, 'read_documentations', 'documentations', '2022-03-12 14:14:44', '2022-03-12 14:14:44'),
(43, 'edit_documentations', 'documentations', '2022-03-12 14:14:44', '2022-03-12 14:14:44'),
(44, 'add_documentations', 'documentations', '2022-03-12 14:14:44', '2022-03-12 14:14:44'),
(45, 'delete_documentations', 'documentations', '2022-03-12 14:14:44', '2022-03-12 14:14:44'),
(46, 'browse_documents', 'documents', '2022-03-24 18:53:35', '2022-03-24 18:53:35'),
(47, 'read_documents', 'documents', '2022-03-24 18:53:35', '2022-03-24 18:53:35'),
(48, 'edit_documents', 'documents', '2022-03-24 18:53:35', '2022-03-24 18:53:35'),
(49, 'add_documents', 'documents', '2022-03-24 18:53:35', '2022-03-24 18:53:35'),
(50, 'delete_documents', 'documents', '2022-03-24 18:53:35', '2022-03-24 18:53:35'),
(51, 'browse_faqs', 'faqs', '2022-03-24 18:56:32', '2022-03-24 18:56:32'),
(52, 'read_faqs', 'faqs', '2022-03-24 18:56:32', '2022-03-24 18:56:32'),
(53, 'edit_faqs', 'faqs', '2022-03-24 18:56:32', '2022-03-24 18:56:32'),
(54, 'add_faqs', 'faqs', '2022-03-24 18:56:32', '2022-03-24 18:56:32'),
(55, 'delete_faqs', 'faqs', '2022-03-24 18:56:32', '2022-03-24 18:56:32');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyAuthApp', '73f53dbeda9179352aae99dcd1c67da42eff1eb5a5feab75cce0ad5d98e7c83c', '[\"*\"]', '2022-03-23 10:31:54', '2022-03-22 17:10:37', '2022-03-23 10:31:54'),
(2, 'App\\Models\\User', 1, 'MyAuthApp', 'db25b4e5f8d3215e7dfc8c9007b6528546ef2e8fc33d699031c824f73e0cb8a4', '[\"*\"]', NULL, '2022-03-23 06:54:33', '2022-03-23 06:54:33'),
(3, 'App\\Models\\User', 1, 'MyAuthApp', 'aa8a3d77c830e5eb48252c1aa9fab68d62692102d67d6074dc6496f857a3846c', '[\"*\"]', NULL, '2022-03-23 07:25:35', '2022-03-23 07:25:35'),
(4, 'App\\Models\\User', 1, 'MyAuthApp', 'ef72bb4ce08203601e0b501cbfcf7ef6148f64b59629d5202cb1b4412355817f', '[\"*\"]', NULL, '2022-03-23 07:25:40', '2022-03-23 07:25:40'),
(5, 'App\\Models\\User', 1, 'MyAuthApp', 'f6490979bfbcefe808a7fbe76852c7338aa9dda5be8f9521b081ca9dd2310b23', '[\"*\"]', NULL, '2022-03-23 07:26:00', '2022-03-23 07:26:00'),
(6, 'App\\Models\\User', 1, 'MyAuthApp', '8777e4c649fb2a06fbed2172fe92c43b8013b2c6b89a3e16c13f44fb38e3dad4', '[\"*\"]', NULL, '2022-03-23 07:33:42', '2022-03-23 07:33:42'),
(7, 'App\\Models\\User', 1, 'MyAuthApp', '7878359dd2bea4a19c27f9b0a403e80a406ca6c38310c0d3a7171ecb499371fd', '[\"*\"]', NULL, '2022-03-23 09:37:48', '2022-03-23 09:37:48'),
(8, 'App\\Models\\User', 1, 'MyAuthApp', '0554c4462e6db788430f90c14bb3a97107cd45de6a667ef5e9240269fba76515', '[\"*\"]', NULL, '2022-03-23 09:40:03', '2022-03-23 09:40:03'),
(9, 'App\\Models\\User', 1, 'MyAuthApp', '8ba70921f2d40c1642e16d93d0d98244702493ab4539abe9503abfd2771260bb', '[\"*\"]', NULL, '2022-03-23 09:41:15', '2022-03-23 09:41:15'),
(10, 'App\\Models\\User', 1, 'MyAuthApp', '038b9b2db053d1ef209c0a115a993436176eb18df1826278e9713feac795011c', '[\"*\"]', NULL, '2022-03-23 09:44:15', '2022-03-23 09:44:15'),
(11, 'App\\Models\\User', 1, 'MyAuthApp', 'fca4bec63b2a87490ce74a5341b5b342b6248bd3913b0bd0f520ec177a36f6ac', '[\"*\"]', NULL, '2022-03-23 09:44:29', '2022-03-23 09:44:29'),
(12, 'App\\Models\\User', 1, 'MyAuthApp', '65d17db011ac312a248f9aad8c233e396ce4c025cd984c8028d6e0c2bda24a7e', '[\"*\"]', NULL, '2022-03-23 09:44:50', '2022-03-23 09:44:50'),
(13, 'App\\Models\\User', 1, 'MyAuthApp', 'be8f4fbd68f35178d2c660d285c27a989aabcdc2682eed089a0255c722c0c0f7', '[\"*\"]', NULL, '2022-03-23 09:45:18', '2022-03-23 09:45:18'),
(14, 'App\\Models\\User', 1, 'MyAuthApp', '35596478e84963e39d26753336de97a102578121d30b1506fbcc3765f9b1b008', '[\"*\"]', NULL, '2022-03-23 09:55:27', '2022-03-23 09:55:27'),
(15, 'App\\Models\\User', 1, 'MyAuthApp', 'dfdbdf4b229b168cb34e43c20e082a5cc1295a96c53a5870d08bf6bd2b6496b6', '[\"*\"]', NULL, '2022-03-23 09:57:30', '2022-03-23 09:57:30'),
(16, 'App\\Models\\User', 1, 'MyAuthApp', '41c1b9d7433e3b4a5694410d15886aa7feefd65de8e8f358b9f1694eede5ebe8', '[\"*\"]', NULL, '2022-03-23 09:59:19', '2022-03-23 09:59:19'),
(17, 'App\\Models\\User', 1, 'MyAuthApp', '031102c6dee324e69602ac2b038f76ae27628bee18792d56a5a32159d37f13c6', '[\"*\"]', NULL, '2022-03-23 10:01:53', '2022-03-23 10:01:53'),
(18, 'App\\Models\\User', 1, 'MyAuthApp', '7dce21e899890760d5773b4910b9869ef15c47aff81d0378e50c17ee539903d7', '[\"*\"]', NULL, '2022-03-23 10:02:39', '2022-03-23 10:02:39'),
(19, 'App\\Models\\User', 1, 'MyAuthApp', '9ab7f8f388f18b49b0d18c521be0404ef55f4a57637a10e290c288201645cf08', '[\"*\"]', NULL, '2022-03-23 10:02:56', '2022-03-23 10:02:56'),
(20, 'App\\Models\\User', 1, 'MyAuthApp', '844387c8d6a03d0804073402594a790ec3ef1fa94222ac03fd702504f94f2bd2', '[\"*\"]', NULL, '2022-03-23 10:03:27', '2022-03-23 10:03:27'),
(21, 'App\\Models\\User', 1, 'MyAuthApp', '53dc2c0b15e87213a48ffab60db8f194c940e4128911ac261a5be6cf271c748a', '[\"*\"]', NULL, '2022-03-23 10:03:44', '2022-03-23 10:03:44'),
(22, 'App\\Models\\User', 1, 'MyAuthApp', '7e0d528a835520ac2f6a807e5fc79ab41f8d76239d2280d3e2a77e21ccf52858', '[\"*\"]', NULL, '2022-03-23 10:04:01', '2022-03-23 10:04:01'),
(23, 'App\\Models\\User', 1, 'MyAuthApp', 'b2dfc940636b29fa1cc17799332b30ae1fed419c4e0f5a7085d9222ad4f48382', '[\"*\"]', NULL, '2022-03-23 10:04:49', '2022-03-23 10:04:49'),
(24, 'App\\Models\\User', 1, 'MyAuthApp', '1068757f371b33ad51a5c6ed810a80f7bd879618d59c0217bab521f921b894dd', '[\"*\"]', NULL, '2022-03-23 10:05:05', '2022-03-23 10:05:05'),
(25, 'App\\Models\\User', 1, 'MyAuthApp', '7358acb72d87e2f502d794a992f56ea2f82eb1728378392cf1c3a50670e3406b', '[\"*\"]', NULL, '2022-03-23 10:05:26', '2022-03-23 10:05:26'),
(26, 'App\\Models\\User', 1, 'MyAuthApp', '7a17d8700a48bf5e5b5fb414567ca439005f94932c014650243e6b79efabe246', '[\"*\"]', NULL, '2022-03-23 10:06:34', '2022-03-23 10:06:34'),
(27, 'App\\Models\\User', 1, 'MyAuthApp', 'af904ea5c4f6ec4f5e0f4fd339cbe986f39f6ae8266428eea5f7448754e292b4', '[\"*\"]', NULL, '2022-03-23 10:06:58', '2022-03-23 10:06:58'),
(28, 'App\\Models\\User', 1, 'MyAuthApp', 'fb4da110bddc72a645de6e738e417c9eb739d55a196383735458eb8c48e5aae4', '[\"*\"]', NULL, '2022-03-23 10:07:25', '2022-03-23 10:07:25'),
(29, 'App\\Models\\User', 1, 'MyAuthApp', 'aa0794e40528d6ec3245eed0c9fa015ac73435f73d4fb2f82e4726ea0a2f2a4d', '[\"*\"]', NULL, '2022-03-23 10:08:22', '2022-03-23 10:08:22'),
(30, 'App\\Models\\User', 1, 'MyAuthApp', 'a2924b8e6558ea6054de22465791a655b3974c750ee26ea64b159703eecd4a16', '[\"*\"]', '2022-03-24 10:31:47', '2022-03-23 10:10:14', '2022-03-24 10:31:47'),
(31, 'App\\Models\\User', 1, 'MyAuthApp', '76a6fcb8dad49a5872934945bd496892d0874c049fa4e3490917752526f2da42', '[\"*\"]', NULL, '2022-03-23 10:42:15', '2022-03-23 10:42:15'),
(32, 'App\\Models\\User', 1, 'MyAuthApp', '6fb37fa2500d6b5781000a0e4739dd50c34dcb431fbf188716bc690238fafa23', '[\"*\"]', NULL, '2022-03-23 10:43:09', '2022-03-23 10:43:09'),
(33, 'App\\Models\\User', 1, 'MyAuthApp', 'c5a0e659e77d316753e16597c3c18d52ea1faf4282a5ed9f9e9e09206603a0a1', '[\"*\"]', NULL, '2022-03-23 10:44:28', '2022-03-23 10:44:28'),
(34, 'App\\Models\\User', 1, 'MyAuthApp', '63651d6327bec0263c803907763238c52d632af56cfdf12d138d79527791a0d2', '[\"*\"]', NULL, '2022-03-23 10:44:46', '2022-03-23 10:44:46'),
(35, 'App\\Models\\User', 1, 'MyAuthApp', '2283f9dc4982f969e8357f112b89a5c3ca6b2d0f1c415eb80eda4a4314df13e8', '[\"*\"]', '2022-03-24 10:33:48', '2022-03-23 10:46:09', '2022-03-24 10:33:48'),
(36, 'App\\Models\\User', 1, 'MyAuthApp', '2db1179614b7db8e13c0618c3064da425bda0919dc0b6ae6c3e1b8f905e4fd88', '[\"*\"]', NULL, '2022-03-24 18:52:21', '2022-03-24 18:52:21'),
(37, 'App\\Models\\User', 1, 'MyAuthApp', 'f4a70c57126d0e262f5c8fc23132efdc3d284670851d5585dd367efc38495353', '[\"*\"]', NULL, '2022-03-24 18:52:28', '2022-03-24 18:52:28'),
(38, 'App\\Models\\User', 1, 'MyAuthApp', '07b192950dcced8f7cc7e6f80d18306090e12bc60cf4d8729db5b68d28c3cb7c', '[\"*\"]', NULL, '2022-03-24 18:52:51', '2022-03-24 18:52:51'),
(39, 'App\\Models\\User', 1, 'MyAuthApp', '75e5ebfe544e950e006eccfdbde9dc4d43c41194f5e695a60ae0257352605701', '[\"*\"]', '2022-03-24 19:04:20', '2022-03-24 18:52:57', '2022-03-24 19:04:20');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-03-12 11:37:55', '2022-03-12 11:37:55');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/March2022/1rNI2X38ZXJcgzkLcLsj.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Centre ressources', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings/March2022/YFKXiUGgQUtZwPjRjhcp.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/March2022/vvv7k7Vk2IwYqZ91CHSX.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'admin.token_access', 'token_access', 'udGkjOLr7qrdBC4V5SNaTygBeoY3oHr5', NULL, 'text', 6, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `sites`
--

CREATE TABLE `sites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sites`
--

INSERT INTO `sites` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'L\'Observateur', 'https://www.lobservateur.fr', NULL, NULL),
(2, 'L\'Observateur de Beauvais', 'https://www.lobservateurdebeauvais.fr', NULL, NULL),
(3, 'Le journal de Ham', 'https://www.lejournaldeham.fr', NULL, '2022-03-23 14:28:52'),
(4, 'Le courier d\'Hirson', 'https://www.lecourrierdhirson.fr/', NULL, NULL),
(5, 'L\'Écho du Thelle', 'https://www.lechoduthelle.fr/', NULL, NULL),
(6, 'Le democrate de Bergerac', 'https://www.ledemocratedebergerac.fr/', NULL, NULL),
(7, 'Le Bonhomme Picard', 'https://www.lebonhommepicard.fr/', NULL, NULL),
(8, 'La Semaine des Pyrennées', 'https://www.lasemainedespyrenees.fr/', NULL, NULL),
(9, 'La Semaine des Ardennes', 'https://www.lasemainedesardennes.fr/', NULL, NULL),
(10, 'La Semaine de l\'Allier', 'https://www.lasemainedelallier.fr/', NULL, NULL),
(11, 'La Thierache', 'https://www.la-thierache.fr/', NULL, NULL),
(12, 'Écho IDF', 'https://www.echoidf.fr/', NULL, NULL),
(13, 'Site Local Développement APP', 'http://centreressources.local', '2022-03-23 14:28:00', '2022-03-23 14:28:47');

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'thumbnail', NULL, NULL),
(2, 'video', NULL, NULL),
(3, 'pdf', NULL, NULL),
(4, 'pub', NULL, NULL),
(5, 'menu', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `post`) VALUES
(1, 1, 'geoffreyM', 'geoffrey.motte@cmc-dev.com', 'users/default.png', NULL, '$2y$10$CSAVagYZuCkOmUoRjpxGM.9frZh4SsRU6ReyW5cIf7CE3xZiPxtUm', 'QXPH0nAmID6foHagqgHL0YusEWuC0djPnInKjTgLeuM9xcSMNsKSJkPyXBHz', '{\"locale\":\"en\"}', '2022-03-12 11:38:28', '2022-03-31 13:02:24', 'Développeur Web');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `category_documentation`
--
ALTER TABLE `category_documentation`
  ADD KEY `category_documentation_category_id_foreign` (`category_id`),
  ADD KEY `category_documentation_doc_id_foreign` (`documentation_id`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `documentations`
--
ALTER TABLE `documentations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documentations_slug_unique` (`slug`);

--
-- Index pour la table `documentation_site`
--
ALTER TABLE `documentation_site`
  ADD KEY `site_documentation_site_id_foreign` (`site_id`),
  ADD KEY `site_documentation_doc_id_foreign` (`documentation_id`);

--
-- Index pour la table `documentation_tag`
--
ALTER TABLE `documentation_tag`
  ADD KEY `tag_documentation_tag_id_foreign` (`tag_id`),
  ADD KEY `tag_documentation_doc_id_foreign` (`documentation_id`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `document_site`
--
ALTER TABLE `document_site`
  ADD KEY `documents_site_site_id_foreign` (`site_id`),
  ADD KEY `documents_site_document_id_foreign` (`document_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_doc_id_foreign` (`doc_id`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_index_id_index` (`index_id`),
  ADD KEY `logs_user_id_index` (`user_id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `documentations`
--
ALTER TABLE `documentations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `category_documentation`
--
ALTER TABLE `category_documentation`
  ADD CONSTRAINT `category_documentation_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_documentation_doc_id_foreign` FOREIGN KEY (`documentation_id`) REFERENCES `documentations` (`id`);

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `documentation_site`
--
ALTER TABLE `documentation_site`
  ADD CONSTRAINT `site_documentation_doc_id_foreign` FOREIGN KEY (`documentation_id`) REFERENCES `documentations` (`id`),
  ADD CONSTRAINT `site_documentation_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`);

--
-- Contraintes pour la table `documentation_tag`
--
ALTER TABLE `documentation_tag`
  ADD CONSTRAINT `tag_documentation_doc_id_foreign` FOREIGN KEY (`documentation_id`) REFERENCES `documentations` (`id`),
  ADD CONSTRAINT `tag_documentation_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Contraintes pour la table `document_site`
--
ALTER TABLE `document_site`
  ADD CONSTRAINT `documents_site_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `documents_site_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`);

--
-- Contraintes pour la table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_doc_id_foreign` FOREIGN KEY (`doc_id`) REFERENCES `documentations` (`id`);

--
-- Contraintes pour la table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
