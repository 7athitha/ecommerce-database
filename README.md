# ecommerce-database

This project contains the database design and SQL schema for an e-commerce platform. It was built to support key online shopping features like managing products, brands, sizes, variations, categories, and custom product attributes.

The goal was to create a **normalized, scalable, and flexible schema** suitable for a real-world online store.

---

## Project Goals

- Allow storing of multiple product variations (e.g., colors, sizes)
- Support inventory at the SKU level
- Enable grouping products into categories and brands
- Allow storing detailed product attributes (e.g., material, weight, voltage)
- Include image support for products
- Keep the database normalized to reduce redundancy

---

## Files in this Repository

- `ecommerce.sql` – SQL file with all `CREATE TABLE` statements
- `README.md` – This file (project explanation)
- `erd.png`

---

## How the Database is Structured

### `brand`
- Stores brand names and logos.
- Helps categorize products under recognized labels.

### `product_category`
- Stores product categories.
- Supports parent-child hierarchy (e.g., "Clothing" > "Shirts").

### `product`
- Stores general product details like name, description, and base price.
- Links to both a `brand` and a `product_category`.

### `product_image`
- Stores one or more images for each product.
- Includes an `is_primary` flag to show the main product image.

### `color`
- Stores available color options used in product variations.

### `size_category` and `size_option`
- `size_category`: Groups sizes by context (e.g., Clothing sizes vs. Shoe sizes).
- `size_option`: Individual sizes like "M", "L", "42", etc.

### `product_item`
- Each row represents a unique, purchasable product unit (like a specific size/color combo).
- Includes SKU, stock quantity, and price.

### `product_variation`
- Records combinations of `product`, `color`, and `size`.
- Used to organize available options for users to select from on the product page.

### `product_attribute`, `attribute_type`, `attribute_category`
- Allows products to have flexible, custom attributes (e.g., fabric type, power usage).
- Each attribute has a type (text, number, boolean) and a category (technical, physical).

---
