# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow contains only unknown_registry custom nodes and none provided an aux_id (GitHub repo),
# so they could not be automatically resolved or installed. Listed below are the unresolved node types:

# download models into comfyui
RUN comfy model download --url https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors?download=true --relative-path models/checkpoints --filename sd_xl_refiner_1.0.safetensors
RUN comfy model download --url https://civitai.com/api/download/models/2358314?token=7c025e410b9fe1d41ae385a2ea49ef31 --relative-path models/checkpoints --filename JANKUTrainedNoobaiRouwei_v60.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
