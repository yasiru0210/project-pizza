// Enhanced dialog creation functions with modern styling
function createDialogPizzeria(csrf) {
    // Remove existing dialog if any
    $("#dialog-form").remove();
    
    let dialogForm = $("<div>").attr("id", "dialog-form").attr("title", "Add New Pizzeria");
    let form = $("<form>").attr("action", "/pizzerias/create").attr("method", "post").addClass("dialog-form");

    form.append('<input type="hidden" name="_csrf" value="' + csrf + '">');
    
    form.append('<div class="form-group">');
    form.append('<label for="name" class="form-label">Name *</label>');
    form.append('<input type="text" id="name" name="name" class="form-input" maxlength="64" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="phone" class="form-label">Phone *</label>');
    form.append('<input type="text" id="phone" name="phone" class="form-input" maxlength="12" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="address" class="form-label">Address *</label>');
    form.append('<input type="text" id="address" name="address" class="form-input" maxlength="128" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="description" class="form-label">Description</label>');
    form.append('<textarea id="description" name="description" class="form-textarea" rows="3"></textarea>');
    form.append('</div>');

    form.append('<div class="form-actions">');
    form.append('<button type="submit" class="btn btn-primary">Create Pizzeria</button>');
    form.append('<button type="button" class="btn btn-secondary" onclick="$(\'#dialog-form\').dialog(\'close\')">Cancel</button>');
    form.append('</div>');

    dialogForm.append(form);

    // Add custom CSS for dialog
    if (!$('#dialog-styles').length) {
        $('head').append(`
            <style id="dialog-styles">
                .ui-dialog {
                    border-radius: 12px !important;
                    box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1) !important;
                    border: 1px solid #e2e8f0 !important;
                }
                .ui-dialog-titlebar {
                    background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%) !important;
                    color: white !important;
                    border: none !important;
                    border-radius: 12px 12px 0 0 !important;
                    padding: 16px 20px !important;
                    font-weight: 600 !important;
                }
                .ui-dialog-titlebar-close {
                    background: rgba(255, 255, 255, 0.2) !important;
                    border: none !important;
                    border-radius: 6px !important;
                    color: white !important;
                }
                .ui-dialog-content {
                    padding: 24px !important;
                    background: white !important;
                }
                .dialog-form {
                    display: flex;
                    flex-direction: column;
                    gap: 20px;
                }
                .form-group {
                    display: flex;
                    flex-direction: column;
                    gap: 8px;
                }
                .form-label {
                    font-weight: 600;
                    color: #334155;
                    font-size: 14px;
                }
                .form-input, .form-textarea {
                    padding: 12px 16px;
                    border: 2px solid #e2e8f0;
                    border-radius: 8px;
                    font-size: 16px;
                    transition: all 200ms ease-in-out;
                    font-family: inherit;
                }
                .form-input:focus, .form-textarea:focus {
                    outline: none;
                    border-color: #ef4444;
                    box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
                }
                .form-textarea {
                    resize: vertical;
                    min-height: 80px;
                }
                .form-actions {
                    display: flex;
                    gap: 12px;
                    justify-content: flex-end;
                    margin-top: 8px;
                }
                .form-actions .btn {
                    padding: 10px 20px;
                    border: none;
                    border-radius: 8px;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 200ms ease-in-out;
                    font-size: 14px;
                }
                .form-actions .btn-primary {
                    background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                    color: white;
                }
                .form-actions .btn-primary:hover {
                    background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                    transform: translateY(-1px);
                }
                .form-actions .btn-secondary {
                    background: #f1f5f9;
                    color: #475569;
                }
                .form-actions .btn-secondary:hover {
                    background: #e2e8f0;
                }
            </style>
        `);
    }

    dialogForm.dialog({
        autoOpen: false,
        height: 'auto',
        width: 450,
        modal: true,
        resizable: false,
        draggable: true
    });
    
    dialogForm.dialog("open");
}

function editableDialogPizzeria(csrf, pizzeria) {
    $("#dialog-form").remove();
    
    let dialogForm = $("<div>").attr("id", "dialog-form").attr("title", "Edit Pizzeria");
    let form = $("<form>").attr("action", "/pizzerias/edit/" + pizzeria.id).attr("method", "post").addClass("dialog-form");

    form.append('<input type="hidden" name="_csrf" value="' + csrf + '">');
    
    form.append('<div class="form-group">');
    form.append('<label for="name" class="form-label">Name *</label>');
    form.append('<input type="text" id="name" name="name" class="form-input" maxlength="64" value="' + pizzeria.name + '" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="phone" class="form-label">Phone *</label>');
    form.append('<input type="text" id="phone" name="phone" class="form-input" maxlength="12" value="' + pizzeria.phone + '" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="address" class="form-label">Address *</label>');
    form.append('<input type="text" id="address" name="address" class="form-input" maxlength="128" value="' + pizzeria.address + '" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="description" class="form-label">Description</label>');
    form.append('<textarea id="description" name="description" class="form-textarea" rows="3">' + pizzeria.description + '</textarea>');
    form.append('</div>');

    form.append('<div class="form-actions">');
    form.append('<button type="submit" class="btn btn-primary">Update Pizzeria</button>');
    form.append('<button type="button" class="btn btn-secondary" onclick="$(\'#dialog-form\').dialog(\'close\')">Cancel</button>');
    form.append('</div>');

    dialogForm.append(form);

    dialogForm.dialog({
        autoOpen: false,
        height: 'auto',
        width: 450,
        modal: true,
        resizable: false,
        draggable: true
    });

    dialogForm.dialog("open");
}

function createDialogMeal(csrf) {
    $("#dialog-form").remove();
    
    let dialogForm = $("<div>").attr("id", "dialog-form").attr("title", "Add New Meal");
    let form = $("<form>").attr("action", "/meals/create").attr("method", "post").addClass("dialog-form");

    form.append('<input type="hidden" name="_csrf" value="' + csrf + '">');
    
    form.append('<div class="form-group">');
    form.append('<label for="name" class="form-label">Name *</label>');
    form.append('<input type="text" id="name" name="name" class="form-input" maxlength="64" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="description" class="form-label">Description</label>');
    form.append('<textarea id="description" name="description" class="form-textarea" rows="3"></textarea>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="price" class="form-label">Price (€) *</label>');
    form.append('<input type="number" id="price" name="price" class="form-input" min="0" step="0.01" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="category" class="form-label">Category *</label>');
    form.append('<select id="category" name="category" class="form-input" required>');
    form.append('<option value="">Select a category</option>');
    form.append('<option value="Salad">🥗 Salad</option>');
    form.append('<option value="Pizza">🍕 Pizza</option>');
    form.append('<option value="Pasta">🍝 Pasta</option>');
    form.append('<option value="Dessert">🍰 Dessert</option>');
    form.append('</select>');
    form.append('</div>');

    form.append('<div class="form-actions">');
    form.append('<button type="submit" class="btn btn-primary">Create Meal</button>');
    form.append('<button type="button" class="btn btn-secondary" onclick="$(\'#dialog-form\').dialog(\'close\')">Cancel</button>');
    form.append('</div>');

    dialogForm.append(form);

    dialogForm.dialog({
        autoOpen: false,
        height: 'auto',
        width: 450,
        modal: true,
        resizable: false,
        draggable: true
    });
    
    dialogForm.dialog("open");
}

function editableDialogMeal(csrf, meal) {
    $("#dialog-form").remove();
    
    let dialogForm = $("<div>").attr("id", "dialog-form").attr("title", "Edit Meal");
    let form = $("<form>").attr("action", "/meals/edit/" + meal.id).attr("method", "post").addClass("dialog-form");

    form.append('<input type="hidden" name="_csrf" value="' + csrf + '">');
    
    form.append('<div class="form-group">');
    form.append('<label for="name" class="form-label">Name *</label>');
    form.append('<input type="text" id="name" name="name" class="form-input" maxlength="64" value="' + meal.name + '" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="description" class="form-label">Description</label>');
    form.append('<textarea id="description" name="description" class="form-textarea" rows="3">' + meal.description + '</textarea>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="price" class="form-label">Price (€) *</label>');
    form.append('<input type="number" id="price" name="price" class="form-input" min="0" step="0.01" value="' + meal.price + '" required>');
    form.append('</div>');

    form.append('<div class="form-group">');
    form.append('<label for="category" class="form-label">Category *</label>');
    form.append('<select id="category" name="category" class="form-input" required>');
    form.append('<option value="Salad" ' + (meal.category === 'Salad' ? 'selected' : '') + '>🥗 Salad</option>');
    form.append('<option value="Pizza" ' + (meal.category === 'Pizza' ? 'selected' : '') + '>🍕 Pizza</option>');
    form.append('<option value="Pasta" ' + (meal.category === 'Pasta' ? 'selected' : '') + '>🍝 Pasta</option>');
    form.append('<option value="Dessert" ' + (meal.category === 'Dessert' ? 'selected' : '') + '>🍰 Dessert</option>');
    form.append('</select>');
    form.append('</div>');

    form.append('<div class="form-actions">');
    form.append('<button type="submit" class="btn btn-primary">Update Meal</button>');
    form.append('<button type="button" class="btn btn-secondary" onclick="$(\'#dialog-form\').dialog(\'close\')">Cancel</button>');
    form.append('</div>');

    dialogForm.append(form);

    dialogForm.dialog({
        autoOpen: false,
        height: 'auto',
        width: 450,
        modal: true,
        resizable: false,
        draggable: true
    });

    dialogForm.dialog("open");
}

// Enhanced search functionality
function handleEnter(event) {
    if (event.key === "Enter") {
        let enteredName = document.getElementById("nameInput").value.trim();
        if (enteredName !== "") {
            window.location.href = "/?name=" + encodeURIComponent(enteredName);
        } else {
            window.location.href = "/";
        }
    }
}

// Enhanced table sorting with visual feedback
function sortTable(target_table, column_index) {
    let table = document.getElementById(target_table);
    if (!table) return;
    
    let tbody = table.querySelector('tbody');
    let rows = Array.from(tbody.querySelectorAll('tr'));
    let isAscending = table.getAttribute('data-sort-direction') !== 'asc';
    
    // Add loading state
    table.classList.add('loading');
    
    setTimeout(() => {
        rows.sort((a, b) => {
            let aVal = a.cells[column_index].textContent.trim().toLowerCase();
            let bVal = b.cells[column_index].textContent.trim().toLowerCase();
            
            // Handle numeric values (prices)
            if (aVal.includes('€')) {
                aVal = parseFloat(aVal.replace('€', ''));
                bVal = parseFloat(bVal.replace('€', ''));
            }
            
            if (isAscending) {
                return aVal > bVal ? 1 : -1;
            } else {
                return aVal < bVal ? 1 : -1;
            }
        });
        
        // Clear tbody and append sorted rows
        tbody.innerHTML = '';
        rows.forEach(row => tbody.appendChild(row));
        
        // Update sort direction
        table.setAttribute('data-sort-direction', isAscending ? 'asc' : 'desc');
        
        // Update sort button text
        let sortBtn = table.querySelector(`th:nth-child(${column_index + 1}) .sort-btn`);
        if (sortBtn) {
            sortBtn.textContent = isAscending ? '↑' : '↓';
        }
        
        // Remove loading state
        table.classList.remove('loading');
        
        // Add visual feedback
        rows.forEach((row, index) => {
            setTimeout(() => {
                row.style.transform = 'translateX(0)';
                row.style.opacity = '1';
            }, index * 50);
        });
    }, 100);
}

// Add smooth animations on page load
document.addEventListener('DOMContentLoaded', function() {
    // Animate table rows on load
    const tableRows = document.querySelectorAll('tbody tr');
    tableRows.forEach((row, index) => {
        row.style.opacity = '0';
        row.style.transform = 'translateY(20px)';
        setTimeout(() => {
            row.style.transition = 'all 300ms ease-out';
            row.style.opacity = '1';
            row.style.transform = 'translateY(0)';
        }, index * 50);
    });
    
    // Animate cards on load
    const cards = document.querySelectorAll('.content-card, .detail-card');
    cards.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        setTimeout(() => {
            card.style.transition = 'all 400ms ease-out';
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, index * 200);
    });
});

// Enhanced form validation
function validateForm(form) {
    const inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
    let isValid = true;
    
    inputs.forEach(input => {
        if (!input.value.trim()) {
            input.style.borderColor = '#ef4444';
            input.style.boxShadow = '0 0 0 3px rgba(239, 68, 68, 0.1)';
            isValid = false;
            
            // Remove error styling on input
            input.addEventListener('input', function() {
                this.style.borderColor = '#e2e8f0';
                this.style.boxShadow = 'none';
            }, { once: true });
        }
    });
    
    return isValid;
}

// Add confirmation dialogs with better styling
function confirmDelete(message) {
    return confirm(message || 'Are you sure you want to delete this item? This action cannot be undone.');
}

// Enhanced search with debouncing
let searchTimeout;
function debounceSearch(callback, delay = 300) {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(callback, delay);
}

// Add keyboard shortcuts
document.addEventListener('keydown', function(e) {
    // Ctrl/Cmd + K to focus search
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
        e.preventDefault();
        const searchInput = document.getElementById('nameInput');
        if (searchInput) {
            searchInput.focus();
        }
    }
    
    // Escape to close dialogs
    if (e.key === 'Escape') {
        const dialog = document.getElementById('dialog-form');
        if (dialog && $(dialog).dialog('isOpen')) {
            $(dialog).dialog('close');
        }
    }
});