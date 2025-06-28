<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="../styles/style.css">
    <link rel="stylesheet" href="../styles/detail.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../scripts/script.js"></script>
    <title>Pizza-Panel | ${(pizzeria.name?has_content)?then(pizzeria.name, 'Pizzeria')} Details</title>
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

    <main class="detail-container">
        <#if pizzeria??>
            <div class="detail-card">
                <div class="detail-header">
                    <h1 class="detail-title">${pizzeria.getName()}</h1>
                </div>
                <div class="detail-content">
                    <div class="detail-grid">
                        <div class="detail-item">
                            <div class="detail-label">Name</div>
                            <div class="detail-value">${pizzeria.getName()}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Phone</div>
                            <div class="detail-value">${pizzeria.getPhone()}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Address</div>
                            <div class="detail-value">${pizzeria.getAddress()}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Description</div>
                            <div class="detail-value">${pizzeria.getDescription()}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Pizzeria ID</div>
                            <div class="detail-value">${pizzeria.pizzeria_id}</div>
                        </div>
                    </div>

                    <div class="detail-actions">
                        <button class="btn btn-secondary" onclick="editableDialogPizzeria('${_csrf.token}', {'id': ${pizzeria.pizzeria_id},'name': '${pizzeria.name}', 'phone': '${pizzeria.phone}', 'address': '${pizzeria.address}', 'description': '${pizzeria.description}'})">
                            Edit Pizzeria
                        </button>
                        <form action="/pizzerias/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this pizzeria?')">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" name="pizzeriaId" value="${pizzeria.pizzeria_id}">
                            <button class="btn btn-danger" type="submit">Delete Pizzeria</button>
                        </form>
                    </div>
                </div>
            </div>

            <#if meals?size == 0>
                <div class="not-found">
                    <div class="not-found-icon">🍽️</div>
                    <h3>No meals available</h3>
                    <p>You need to create meals first before adding them to this pizzeria.</p>
                    <a href="/meals">Create your first meal</a>
                </div>
            <#elseif mealsNotInPizzeria?size == 0>
                <div class="not-found">
                    <div class="not-found-icon">✅</div>
                    <h3>All meals added</h3>
                    <p>All available meals are already in this pizzeria.</p>
                </div>
            <#else>
                <div class="add-meals-section">
                    <h2 class="section-title">Add Meals to Pizzeria</h2>
                    <form action="/pizzerias/addMeal" method="post" class="add-meal-form">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="pizzeriaId" value="${pizzeria.pizzeria_id}">
                        <div class="form-group">
                            <label for="mealId" class="form-label">Select Meal</label>
                            <select name="mealId" id="meal_id" class="form-select">
                                <#list mealsNotInPizzeria as mealNotInPizzeria>
                                    <option value="${mealNotInPizzeria.meal_id}">${mealNotInPizzeria.name} - ${mealNotInPizzeria.price}€</option>
                                </#list>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Add Meal</button>
                    </form>
                </div>
            </#if>

            <div class="meals-section">
                <h2 class="section-title">Current Menu</h2>
                <div class="meals-table-container">
                    <#if pizzeriaMeals?size == 0>
                        <div class="empty-state">
                            <div class="empty-state-icon">📋</div>
                            <h3>No meals in menu</h3>
                            <p>Add meals to this pizzeria to build your menu.</p>
                        </div>
                    <#else>
                        <table class="meals-table" id="meals_table">
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
                                <#list pizzeriaMeals as pizzeriaMeal>
                                    <tr>
                                        <td><strong>${pizzeriaMeal.getName()}</strong></td>
                                        <td>${pizzeriaMeal.getDescription()}</td>
                                        <td><span class="price">${pizzeriaMeal.getPrice()}€</span></td>
                                        <td>
                                            <span class="category-badge category-${pizzeriaMeal.getCategory()?lower_case}">
                                                ${pizzeriaMeal.getCategory()}
                                            </span>
                                        </td>
                                        <td>
                                            <div class="action-buttons">
                                                <form action="/pizzerias/deleteMeal" method="post">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <input type="hidden" name="mealId" value="${pizzeriaMeal.meal_id}">
                                                    <input type="hidden" name="pizzeriaId" value="${pizzeria.pizzeria_id}">
                                                    <button class="btn btn-danger btn-sm" type="submit">Remove</button>
                                                </form>
                                                <form action="/meals/${pizzeriaMeal.meal_id}" method="get">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <button class="btn btn-primary btn-sm" type="submit">Details</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </#list>
                            </tbody>
                        </table>
                    </#endif>
                </div>
            </div>
        <#else>
            <div class="not-found">
                <div class="not-found-icon">❌</div>
                <h3>Pizzeria not found</h3>
                <p>The pizzeria you're looking for doesn't exist or has been removed.</p>
                <a href="/pizzerias">Back to Pizzerias</a>
            </div>
        </#if>
    </main>
</body>
</html>