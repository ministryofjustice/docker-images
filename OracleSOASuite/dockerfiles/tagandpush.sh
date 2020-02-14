IMAGE=localhost/oracle/soasuite:12.2.1.3
HASH=$(git log -1 --pretty=%h)
REPO=902837325998.dkr.ecr.eu-west-2.amazonaws.com/laa-ccms-soa

# Login to AWS ECR
echo
echo "Loging in to repo..."
eval $(aws ecr get-login --region eu-west-2 --no-include-email --profile laa-shared-services-lz)

# Tag and push to repo
echo
echo "Tagging and uploading $REPO:$HASH"
docker tag $IMAGE $REPO:$HASH
docker push $REPO:$HASH
echo
echo "Tagging and uploading $REPO:latest"
docker tag $IMAGE $REPO:latest
docker push $REPO:latest
