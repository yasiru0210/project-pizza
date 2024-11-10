package com.example.pizza.repositories;

import com.example.pizza.models.MealModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MealRepository extends JpaRepository<MealModel, Long> {
    List<MealModel> findByName(String name);
}