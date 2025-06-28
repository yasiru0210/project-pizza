<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza-Panel | Registration</title>
    <style>
        :root {
            --primary-500: #ef4444;
            --primary-600: #dc2626;
            --primary-700: #b91c1c;
            --secondary-50: #f8fafc;
            --secondary-100: #f1f5f9;
            --secondary-200: #e2e8f0;
            --secondary-500: #64748b;
            --secondary-700: #334155;
            --secondary-800: #1e293b;
            --error-500: #ef4444;
            --space-2: 0.5rem;
            --space-3: 0.75rem;
            --space-4: 1rem;
            --space-6: 1.5rem;
            --space-8: 2rem;
            --space-12: 3rem;
            --radius-base: 0.5rem;
            --radius-lg: 1rem;
            --radius-xl: 1.5rem;
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
            --transition-base: 200ms ease-in-out;
            --font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-family);
            background: linear-gradient(135deg, var(--secondary-50) 0%, #fef2f2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--space-4);
        }

        .registration-container {
            background: white;
            padding: var(--space-8);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-xl);
            width: 100%;
            max-width: 400px;
            border: 1px solid var(--secondary-100);
        }

        .registration-header {
            text-align: center;
            margin-bottom: var(--space-8);
        }

        .registration-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--secondary-800);
            margin-bottom: var(--space-2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-3);
        }

        .registration-subtitle {
            color: var(--secondary-500);
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: var(--space-6);
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: var(--secondary-700);
            margin-bottom: var(--space-2);
            font-size: 0.875rem;
        }

        .form-input {
            width: 100%;
            padding: var(--space-3) var(--space-4);
            border: 2px solid var(--secondary-200);
            border-radius: var(--radius-base);
            font-size: 1rem;
            transition: all var(--transition-base);
            background: white;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary-500);
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
        }

        .submit-btn {
            width: 100%;
            background: linear-gradient(135deg, var(--primary-500) 0%, var(--primary-600) 100%);
            color: white;
            border: none;
            padding: var(--space-3) var(--space-4);
            border-radius: var(--radius-base);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all var(--transition-base);
            box-shadow: var(--shadow-lg);
            margin-bottom: var(--space-6);
        }

        .submit-btn:hover {
            background: linear-gradient(135deg, var(--primary-600) 0%, var(--primary-700) 100%);
            transform: translateY(-1px);
        }

        .error-message {
            background: #fef2f2;
            color: var(--error-500);
            padding: var(--space-3);
            border-radius: var(--radius-base);
            border: 1px solid #fecaca;
            margin-bottom: var(--space-4);
            font-size: 0.875rem;
            text-align: center;
        }

        .login-link {
            text-align: center;
            padding-top: var(--space-4);
            border-top: 1px solid var(--secondary-200);
        }

        .login-link a {
            color: var(--primary-600);
            text-decoration: none;
            font-weight: 500;
            transition: color var(--transition-base);
        }

        .login-link a:hover {
            color: var(--primary-700);
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .registration-container {
                padding: var(--space-6);
            }
            
            .registration-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="registration-header">
            <h1 class="registration-title">
                🍕 Pizza-Panel
            </h1>
            <p class="registration-subtitle">Create your account</p>
        </div>

        <form action="/registration" method="post">
            <div class="form-group">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-input" required />
            </div>
            
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-input" required />
            </div>
            
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            
            <button type="submit" class="submit-btn">Create Account</button>
            
            <#if message??>
                <div class="error-message">
                    ${message}
                </div>
            </#if>
        </form>
        
        <div class="login-link">
            <a href="/login">Already have an account? Sign in</a>
        </div>
    </div>
</body>
</html>