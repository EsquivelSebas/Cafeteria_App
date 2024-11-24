package com.cafeteria.app.service;

import com.cafeteria.app.dto.ProductDTO;
import com.cafeteria.app.model.Category;
import com.cafeteria.app.model.Product;
import com.cafeteria.app.model.Subcategory;
import com.cafeteria.app.repository.CategoryRepository;

import com.cafeteria.app.repository.ProductRepository;
import com.cafeteria.app.repository.SubcategoryRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final SubcategoryRepository subcategoryRepository;

    public ProductService(ProductRepository productRepository,
                          CategoryRepository categoryRepository,
                          SubcategoryRepository subcategoryRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
        this.subcategoryRepository = subcategoryRepository;
    }

    public List<Product> getProductsByCategoryId(Long categoryId) {
        return productRepository.findByCategoryIdAndSubcategoryIsNull(categoryId);
    }

    public List<Product> getProductsBySubcategoryId(Long subcategoryId) {
        return productRepository.findBySubcategoryId(subcategoryId);
    }

    public List<Product> getProductsByIds(List<Long> ids) {
        return productRepository.findByIdIn(ids);
    }

    public Optional<Product> getProductById(Long productId) {
        return productRepository.findById(productId);
    }

    public void delete(Product products) {
        productRepository.delete(products);
    }

    public void save(ProductDTO productDTO) {
        Product product = new Product();
        product.setId(productDTO.getId());
        product.setName(productDTO.getName());
        product.setDescription(productDTO.getDescription());
        product.setPrice(productDTO.getPrice());
        product.setImageUrl(productDTO.getImageUrl());

        if (productDTO.getCategoryId() != null) {
            Category category = categoryRepository.findById(productDTO.getCategoryId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            product.setCategory(category);
        } else {
            throw new RuntimeException("Category ID is required");
        }

        if (productDTO.getSubcategoryId() != null) {
            Subcategory subcategory = subcategoryRepository.findById(productDTO.getSubcategoryId())
                    .orElseThrow(() -> new RuntimeException("Subcategory not found"));
            product.setSubcategory(subcategory);
        } else {
            product.setSubcategory(null);
        }

        productRepository.save(product);
    }
}
