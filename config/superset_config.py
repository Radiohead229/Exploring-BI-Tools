# Feature Flags
# Enable/disable specific features in Apache Superset
FEATURE_FLAGS = {
    "EMBEDDED_SUPERSET": True,  # Enables embedded Superset in other applications or platforms
}

# Proxy Configuration
# Enables support for reverse proxy setups
ENABLE_PROXY_FIX = True  # Adjusts headers when Superset is behind a proxy to handle redirects correctly

# Cookie Settings
# Control the behavior of session cookies
SESSION_COOKIE_SAMESITE = 'None'  # Allows cookies to be sent with cross-site requests, needed for embedding

# Role Configuration
# Set permissions for public access users
PUBLIC_ROLE_LIKE_GAMMA = False  # Makes the public role not inherit permissions from Gamma (default user role)
AUTH_ROLE_PUBLIC = 'newdelta'    # Sets the role assigned to unauthenticated users as newdelta, allowing limited data access

# Security Settings
# Configurations for Cross-Site Request Forgery (CSRF) protection and HTTP security policies
WTF_CSRF_ENABLED = False  # Disables CSRF protection, useful for testing or if embedding Superset with external applications
TALISMAN_ENABLED = False  # Disables the Talisman extension for HTTP security, useful for development but risky for production
