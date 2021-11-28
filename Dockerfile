ARG BASE_IMG
FROM $BASE_IMG 

RUN apt-get update -y
RUN apt-get install -yqqq ffmpeg libsndfile-dev

# Base
RUN pip install numba==0.48 \
        numpy==1.18.3 \
        pandas==1.0.3 \
        joblib==0.13.2 \        
        h5py \
        tqdm \
        fire \
        asyncio aiofiles requests \
        matplotlib scikit-learn seaborn
        
# NLP + Sound
RUN pip install nltk==3.2.5 \
                sentencepiece \
                sacrebleu \
                pymorphy2[fast] \
                -U pymorphy2-dicts-ru \
                pydub \
                librosa==0.6.3 \
                python_speech_features \
                samplerate \
                resampy \
                soundfile

# JupyterLab
RUN pip install jupyterlab && jupyter serverextension enable --py jupyterlab
RUN pip install onnxruntime
RUN pip install pyrubberband==0.3.0 ipyparallel==6.3.0
RUN pip install aiobotocore

# Dark Theme for JupyterLab
COPY conf/jupyter_cfg/themes.jupyterlab-settings /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY conf/jupyter_cfg/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

ARG WORKDIR
WORKDIR $WORKDIR

ENV PYTHONIOENCODING=utf-8
EXPOSE 8888
