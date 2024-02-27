
project_id="uplifted-stream-406713"
template_name="demobench" 

gcloud beta compute instance-templates create $template_name \
 --project=$project_id --machine-type=e2-standard-2 \ 
 --network-interface=network=default,network-tier=PREMIUM \ 
 --instance-template-region=projects/$project_id/regions/europe-west3 \
 --maintenance-policy=MIGRATE --provisioning-model=STANDARD \ 
 --service-account=1056144807809-compute@developer.gserviceaccount.com \
 --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server --create-disk=auto-delete=yes,boot=yes,device-name=demobench,image=projects/debian-cloud/global/images/debian-12-bookworm-v20240213,mode=rw,size=10,type=pd-balanced \
 --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
