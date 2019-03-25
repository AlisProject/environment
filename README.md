# environment
The environment valuables of the ALIS applications. 

# Prerequisite
- aws-cli
- direnv

# Usage
Set environment valuables.

```bash
cp -p ./.envrc.sample ./.envrc
direnv edit
```

Set SSM valuables.

```bash
cp -p ./template.sample.yaml ./template.yaml

# Edit valuables
vi template.yaml
```

Deployment.

```bash
./deploy.sh
```

## For DynamoDB Names
You can use a script to replace table names for `template.yaml`.

```bash
./replace-environment.sh
```


# Linting

## Prerequisite
- yarn

## Dependencies

```bash
yarn
```

## Run

```bash
yarn cfn-lint validate template.sample.yaml
```
