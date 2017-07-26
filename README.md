# Behat Term Manager Extension

Provides a suite to test Term manager.

## Installation
Install using composer as usual, by adding the repo to _composer.json_
```
  "repositories": [
    {
      "type": "vcs",
      "url": "git@github.com:dennisinteractive/behat_term_manager_extension.git"
    }
  ],
```

Then run
`composer require dennisdigital/behat-term-manager-extension:master-dev`

Add the extension the behat.yml on your site.
```
default:
  suites:
    default:
      contexts:
        - FeatureContext
        - DennisDigital\TermManagerExtension\Context\TermManagerContext
```

See examples of tests in https://github.com/dennisinteractive/behat_term_manager_extension/tree/master/features

### Dependencies:
- Behat
- Symfony DPI
- Mink
- Term Manager https://github.com/dennisinteractive/dennis_term_manager
