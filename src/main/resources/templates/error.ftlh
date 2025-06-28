<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza-Panel | Error</title>
    <style>
        :root {
            --primary-500: #ef4444;
            --primary-600: #dc2626;
            --secondary-50: #f8fafc;
            --secondary-100: #f1f5f9;
            --secondary-500: #64748b;
            --secondary-700: #334155;
            --secondary-800: #1e293b;
            --error-500: #ef4444;
            --space-4: 1rem;
            --space-6: 1.5rem;
            --space-8: 2rem;
            --radius-xl: 1.5rem;
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
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

        .error-container {
            background: white;
            padding: var(--space-8);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-xl);
            width: 100%;
            max-width: 600px;
            border: 1px solid var(--secondary-100);
            text-align: center;
        }

        .error-icon {
            font-size: 4rem;
            margin-bottom: var(--space-4);
        }

        .error-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--secondary-800);
            margin-bottom: var(--space-4);
        }

        .error-subtitle {
            color: var(--secondary-500);
            font-size: 1.125rem;
            margin-bottom: var(--space-6);
        }

        .error-details {
            background: #fef2f2;
            border: 1px solid #fecaca;
            border-radius: var(--radius-xl);
            padding: var(--space-6);
            margin-bottom: var(--space-6);
            text-align: left;
        }

        .error-section {
            margin-bottom: var(--space-4);
        }

        .error-section:last-child {
            margin-bottom: 0;
        }

        .error-label {
            font-weight: 600;
            color: var(--secondary-700);
            margin-bottom: var(--space-2);
            display: block;
        }

        .error-content {
            background: white;
            padding: var(--space-4);
            border-radius: var(--radius-base);
            border: 1px solid #fecaca;
            font-family: 'Courier New', monospace;
            font-size: 0.875rem;
            color: var(--error-500);
            white-space: pre-wrap;
            word-break: break-word;
            max-height: 200px;
            overflow-y: auto;
        }

        .back-btn {
            background: linear-gradient(135deg, var(--primary-500) 0%, var(--primary-600) 100%);
            color: white;
            border: none;
            padding: var(--space-3) var(--space-6);
            border-radius: var(--radius-base);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 200ms ease-in-out;
        }

        .back-btn:hover {
            background: linear-gradient(135deg, var(--primary-600) 0%, #b91c1c 100%);
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚠️</div>
        <h1 class="error-title">Oops! Something went wrong</h1>
        <p class="error-subtitle">We encountered an unexpected error while processing your request.</p>
        
        <div class="error-details">
            <div class="error-section">
                <span class="error-label">Error Message:</span>
                <div class="error-content">${(errorMessage?has_content)?then(errorMessage, 'No error message available')}</div>
            </div>
            
            <#if errorCause?has_content>
                <div class="error-section">
                    <span class="error-label">Error Details:</span>
                    <div class="error-content">${errorCause}</div>
                </div>
            </#if>
        </div>
        
        <a href="/" class="back-btn">← Back to Dashboard</a>
    </div>
</body>
</html>