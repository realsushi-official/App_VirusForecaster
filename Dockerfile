# prod dockerfile
# 1. Base image
FROM python:3.8.3-slim

WORKDIR /app

# here we create a new user
# note how the commands are using &&
# this helps with caching
RUN useradd -m -r user && \
    chown user /app

# 2. Copy files
COPY . .

# 3. Install dependencies
RUN pip install -r requirements.txt
USER user

CMD ["python","run.py"]
