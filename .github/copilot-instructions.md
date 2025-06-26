--
applyTo: "**"
--
This is Grav (getgrav.org) theme repository written in PHP and Twig.

## Code Standards

### Required Before Each Commit
- Run `make fmt` before committing any changes to ensure proper code formatting
- This will run gofmt on all Go files to maintain consistent style

### Development Flow
- Build: `make build`
- Test: `make test`
- Full CI check: `make ci` (includes build, fmt, lint, test)

## Repository Structure
- `assets/`: CSS and JavaScript assets
- `blueprints/`: YAML blueprints for admin interface
- `css/`: CSS files
- `fonts/`: Font files
- `images/`: Image assets
- `languages/`: Language files for translations
- `node_modules/`: NPM dependencies
- `templates/`: Twig templates for the theme

## Key Guidelines
1. Follow PHP and Twig best practices and idiomatic patterns
2. Maintain existing code structure and organization
3. Use dependency injection patterns where appropriate
