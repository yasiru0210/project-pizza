<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza-Panel | Meals</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="styles/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="scripts/script.js"></script>
</head>
<body>
    <header>
        <h1>🍕 Pizza-Panel</h1>
    </header>

    <nav>
        <div class="nav-links">
            <a href="/" class="<#if springMacroRequestContext.requestUri == "/">active</#if>">Dashboard</a>
            <a href="/pizzerias" class="<#if springMacroRequestContext.requestUri == "/pizzerias">active</#if>">Pizzerias</a>
            <a href="/meals" class="<#if springMacroRequestContext.requestUri == "/meals">active</#if>">Meals</a>
        </div>
        
        <form action="/logout" method="post" class="logout-form">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="logout-btn">Sign Out</button>
        </form>
    </nav>

    <main class="main-content">
        <div class="content-card">
            <div class="card-header">
                <h2 class="card-title">Manage Meals</h2>
            </div>
            <div class="card-content">
                <button type="button" class="add-btn" onclick="createDialogMeal('${_csrf.token}')">
                    Add New Meal
                </button>
                
                <#if meals?size == 0>
                    <div class="empty-state">
                        <div class="empty-state-icon">🍽️</div>
                        <h3>No meals yet</h3>
                        <p>Create delicious meals to add to your pizzeria menus.</p>
                    </div>
                <#else>
                    <table class="data-table meal-table" id="meals_table">
                        <thead>
                            <tr>
                                <th>Name <button class="sort-btn" onclick="sortTable('meals_table', 0)">↕</button></th>
                                <th>Description <button class="sort-btn" onclick="sortTable('meals_table', 1)">↕</button></th>
                                <th>Price <button class="sort-btn" onclick="sortTable('meals_table', 2)">↕</button></th>
                                <th>Category <button class="sort-btn" onclick="sortTable('meals_table', 3)">↕</button></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#list meals as meal>
                                <tr>
                                    <td><strong>${meal.getName()}</strong></td>
                                    <td>${meal.getDescription()}</td>
                                    <td><span class="price">${meal.getPrice()}€</span></td>
                                    <td>
                                        <span class="category-badge category-${meal.getCategory()?lower_case}">
                                            ${meal.getCategory()}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <form action="/meals/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this meal?')">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="hidden" name="mealId" value="${meal.meal_id}">
                                                <button class="btn btn-danger btn-sm" type="submit">Delete</button>
                                            </form>
                                            <form action="/meals/${meal.meal_id}" method="get">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <button class="btn btn-primary btn-sm" type="submit">Details</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </#list>
                        </tbody>
                    </table>
                </#if>
            </div>
        </div>
    </main>
</body>
</html>