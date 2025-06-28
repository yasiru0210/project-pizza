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
    <title>Pizza-Panel | ${(meal.name?has_content)?then(meal.name, 'Meal')} Details</title>
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
        <#if meal??>
            <div class="detail-card">
                <div class="detail-header">
                    <h1 class="detail-title">${meal.getName()}</h1>
                </div>
                <div class="detail-content">
                    <div class="detail-grid">
                        <div class="detail-item">
                            <div class="detail-label">Name</div>
                            <div class="detail-value">${meal.getName()}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Description</div>
                            <div class="detail-value">${meal.getDescription()}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Price</div>
                            <div class="detail-value price">${meal.getPrice()}€</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Category</div>
                            <div class="detail-value category ${meal.getCategory()?lower_case}">${meal.getCategory()}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Meal ID</div>
                            <div class="detail-value">${meal.meal_id}</div>
                        </div>
                    </div>

                    <div class="detail-actions">
                        <button class="btn btn-secondary" onclick="editableDialogMeal('${_csrf.token}', {'id': ${meal.meal_id},'name': '${meal.name}', 'description': '${meal.description}', 'price': '${meal.price}', 'category': '${meal.category}'})">
                            Edit Meal
                        </button>
                        <form action="/meals/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this meal?')">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" name="mealId" value="${meal.meal_id}">
                            <button class="btn btn-danger" type="submit">Delete Meal</button>
                        </form>
                    </div>
                </div>
            </div>
        <#else>
            <div class="not-found">
                <div class="not-found-icon">❌</div>
                <h3>Meal not found</h3>
                <p>The meal you're looking for doesn't exist or has been removed.</p>
                <a href="/meals">Back to Meals</a>
            </div>
        </#if>
    </main>
</body>
</html>