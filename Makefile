run:
	lsof -i :3333 | awk 'NR!=1 {print $$2}' | xargs -r kill -9
	npx mintlify dev --port 3333

upgrade:
	echo '{ \
	"name": "My Documentation", \
	"favicon": "/favicon.ico", \
	"colors": { "primary": "#6366f1" }, \
	"tabs": [ \
		{ "name": "Components", "url": "content" }, \
		{ "name": "Integrations", "url": "integrations" } \
	], \
	"navigation": [ \
		{ "group": "Components", "pages": [ \
			"content/components/accordions", \
			"content/components/accordion-groups", \
			"content/components/callouts" \
		] }, \
		{ "group": "API Components", "pages": [ \
			"content/components/params", \
			"content/components/responses" \
		] }, \
		{ "group": "Analytics", "pages": [ \
			"integrations/analytics/overview", \
			"integrations/analytics/amplitude", \
			"integrations/analytics/clearbit" \
		] }, \
		{ "group": "SDKs", "pages": [ \
			"integrations/sdks/providers", \
			"integrations/sdks/clients" \
		] } \
	]' > mint.json
	npm i mintlify@latest -g
	mintlify upgrade

port:
	mint dev --port 3333


# Additional Commands
# mintlify openapi-check <openapiFilenameOrUrl>

# Check your OpenAPI file for errors. You can pass in a filename (e.g. ./openapi.yaml) or a URL (e.g. https://petstore3.swagger.io/api/v3/openapi.json).
# mintlify broken-links BETA

# Check for broken internal links in your Mintlify project.
# mintlify rename <from> <to> BETA