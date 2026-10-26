# specifies the Parent Image from which you are building.
FROM python:3.9

# specify the working directory for the image
WORKDIR /code

# install dependencies first so this layer is cached across code changes
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# copy the application code
COPY ./app /code/app

EXPOSE 8080

# run the FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
