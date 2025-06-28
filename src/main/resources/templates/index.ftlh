<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza-Panel | Dashboard</title>
    <link rel="stylesheet" href="styles/style.css">
    <script src="scripts/script.js"></script>
</head>
<body>
    <header>
        <h1>🍕 Pizza-Panel</h1>
    </header>

    <nav>
        <div class="nav-links">
            <a href="/" class="<#if springMacroRequestContext.requestUri?contains("/")>active</#if>">Dashboard</a>
            <a href="/pizzerias" class="<#if springMacroRequestContext.requestUri?contains("/pizzerias")>active</#if>">Pizzerias</a>
            <a href="/meals" class="<#if springMacroRequestContext.requestUri?contains("/meals")>active</#if>">Meals</a>
        </div>
        
        <div class="search-container">
            <input type="text" id="nameInput" placeholder="Search pizzerias..." onkeydown="handleEnter(event)">
        </div>
        
        <form action="/logout" method="post" class="logout-form">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="logout-btn">Sign Out</button>
        </form>
    </nav>

    <main class="main-content">
        <div class="data-container">
            <div class="content-card pizzeria-container">
                <div class="card-header">
                    <h2 class="card-title">Pizzerias</h2>
                </div>
                <div class="card-content">
                    <#if pizzerias?size == 0>
                        <div class="empty-state">
                            <div class="empty-state-icon">🏪</div>
                            <h3>No pizzerias found</h3>
                            <p>Start by creating your first pizzeria to manage your pizza business.</p>
                            <a href="/pizzerias" class="btn btn-primary">Create Pizzeria</a>
                        </div>
                    <#else>
                        <table class="data-table pizzeria-table" id="pizzerias_table">
                            <thead>
                                <tr>
                                    <th>Name <button class="sort-btn" onclick="sortTable('pizzerias_table', 0)">↕</button></th>
                                    <th>Phone <button class="sort-btn" onclick="sortTable('pizzerias_table', 1)">↕</button></th>
                                    <th>Address <button class="sort-btn" onclick="sortTable('pizzerias_table', 2)">↕</button></th>
                                    <th>Description <button class="sort-btn" onclick="sortTable('pizzerias_table', 3)">↕</button></th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#list pizzerias as pizzeria>
                                    <tr>
                                        <td><strong>${pizzeria.getName()}</strong></td>
                                        <td>${pizzeria.getPhone()}</td>
                                        <td>${pizzeria.getAddress()}</td>
                                        <td>${pizzeria.getDescription()}</td>
                                        <td>
                                            <div class="action-buttons">
                                                <form action="/pizzerias/${pizzeria.pizzeria_id}" method="get">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <button class="btn btn-primary btn-sm" type="submit">View Details</button>
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

            <div class="content-card meal-container">
                <div class="card-header">
                    <h2 class="card-title">Meals</h2>
                </div>
                <div class="card-content">
                    <#if meals?size == 0>
                        <div class="empty-state">
                            <div class="empty-state-icon">🍽️</div>
                            <h3>No meals found</h3>
                            <p>Create delicious meals to add to your pizzeria menu.</p>
                            <a href="/meals" class="btn btn-primary">Create Meal</a>
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
                                                <form action="/meals/${meal.meal_id}" method="get">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <button class="btn btn-primary btn-sm" type="submit">View Details</button>
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
        </div>
    </main>
</body>
</html>