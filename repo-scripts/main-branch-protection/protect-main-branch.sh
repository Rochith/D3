#!/bin/bash
set -e

export org="Rochith"
export user="Rochith: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"
export branch="main" 

declare -a repositories=(
    "D3"
)

JSON=$(cat << 'EOF'
    {
        "required_status_checks": null,
        "enforce_admins": true,
        "required_pull_request_reviews": {
            "required_approving_review_count": 2
        },
        "restrictions": null
    }
EOF
)

for repository_name in "${repositories[@]}"; do
    echo "========"
    echo "=======> $repository_name"
    echo "========"
        
    curl \
        --silent \
        --user $user \
        --header "Accept: application/vnd.github.v3+json" \
        --request PUT \
        https://api.github.com/repos/$org/$repository_name/branches/$branch/protection \
        --data "$JSON"

done
