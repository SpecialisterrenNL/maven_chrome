FROM maven:3.6.0-jdk-11-slim

LABEL version="0.1.0"

#Based on best practice of docker.com
RUN apt-get update && apt-get install -y \
    apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	&& apt-get purge --auto-remove -y curl gnupg \
	&& rm /etc/apt/sources.list.d/google-chrome.list \	
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome


