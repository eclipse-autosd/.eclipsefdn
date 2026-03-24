local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.autosd', 'eclipse-autosd') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse Autosd",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('SCP_KEY') {
      value: "pass:bots/automotive.autosd/projects-storage.eclipse.org/id_ed25519",
    },
    orgs.newOrgSecret('SCP_PASSPHRASE') {
      value: "pass:bots/automotive.autosd/projects-storage.eclipse.org/id_ed25519.passphrase",
    },
    orgs.newOrgSecret('SCP_USERNAME') {
      value: "pass:bots/automotive.autosd/projects-storage.eclipse.org/username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('eclipse-autosd') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
  ],
}
