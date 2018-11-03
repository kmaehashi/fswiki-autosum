# fswiki-autosum

## Installation

```
$ cd /path/to/wiki/plugin
$ git clone https://github.com/kmaehashi/fswiki-autosum.git autosum
```

## Syntax

```
{{autosum row-index-to-sum [, total-heading [, currency-mark]]
(Table)
}}
```

## Example

```
{{autosum 1, Total, $
,Date,Amount
,2018-01-01,1000
,2018-01-02,9000
}}
```

|       | Date       | Amount  |
|-------|------------|---------|
|       | 2018-01-01 | $1,000  |
|       | 2018-01-02 | $9,000  |
| Total |            | $10,000 |

# License

MIT License

----

Copyright (C) 2009 Kenichi Maehashi
