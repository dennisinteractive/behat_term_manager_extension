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
or
`composer require dennisdigital/behat-term-manager-extension:~1.0`

Add the extension the behat.yml on your site.
```
default:
  suites:
    default:
      contexts:
        - DennisDigital\TermManagerExtension\Context\TermManagerContext
```

See examples of tests in https://github.com/dennisinteractive/behat_term_manager_extension/tree/master/features

On a given site, you can create a symlink inside the *features* folder pointing to the features of the extension, i.e.
```
cd tests/features
ln -s ../vendor/dennisdigital/behat_term_manager_extension/features term_manager
```
You can commit this symlink

### Dependencies:
- Drupal Context
- Term Manager 7.x-2.x https://github.com/dennisinteractive/dennis_term_manager/tree/7.x-2.x
