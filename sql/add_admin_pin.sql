-- Adds the second-factor PIN column to an already-deployed `admins` table.
-- Safe to run against a live DB: nullable, so existing rows are untouched
-- and existing admins simply can't log in (server.js refuses to issue a
-- full session for a NULL pin_hash) until you set one via:
--
--   npm run create-admin -- <existing-username> <existing-password> <new-pin>
--
-- Run with: mysql -u root -p paycst < sql/add_admin_pin.sql

USE paycst;

ALTER TABLE admins ADD COLUMN pin_hash CHAR(60) NULL AFTER password_hash;
