### Folder Structure 
```
.
├── ...
├── backstage           
│   ├── examples 
│   │   ├── template
│   │   │   ├── react_app_on_s3 
│   │   │   │   ├── skeleton
│   │   │   │   │   ├── .github
│   │   │   │   │   │   └── workflows
│   │   │   │   │   │       └── .github-ci.yml    # Github Action pipeline
│   │   │   │   │   ├── docs                      # Location of TechDocs
│   │   │   │   │   ├── react                     # Frontend application
│   │   │   │   │   ├── s3                        # Terraform code to provision s3 bucket
│   │   │   │   │   └── catalog-info.yaml         # Software catalog definition
│   │   │   │   └── template.yaml                 # Workflow of template
│   ├── packages                                  # Backend and Frontend of Backstage
│   └── app-config.yaml                           # Configuration files
├── Presentation.pptx                             # My Solution
└── README.md
```
