run-local-net:
	netlify dev

run-local:
	yarn run dev

commit:
	git add .
	git commit -m "$(msg)"

deploy-static:
	yarn generate && \
	yarn deploy

deploy:
	git push origin master
