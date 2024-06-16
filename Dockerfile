# use the official python 3.9 image
FROM python:3.9

# set the working directory in the container
WORKDIR /code

# copy the current directory contents in the container at /code
COPY ./requirements.txt /code/requirements.txt

# install dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# set up a new user named "user"
RUN useradd user

# change the ownership of the /code directory to the user
USER user

# set home to the user's home directory
ENV HOME=/home/user \ PATH=/home/user/.local/bin:$PATH

# Set the working directory to the user's home directory
WORKDIR $HOME/app

# Copy the current directory contents into the container at $HOME/app setting
COPY --chown=user . $HOME/app

## Start the FASTAPI App on port 7860
CMD ["uvicorn", "app:app", "--host", "8.0.0.0", "--port", "7860"]