local format = '[%tRROR] %f:%l:%c: %m, [%tRROR] %f:%l: %m, [%tARN] %f:%l:%c: %m, [%tARN] %f:%l: %m, [%tNFO] %f:%l:%c: %m, [%tNFO] %f:%l: %m'

local lint = require('lint')

lint.linters.checkstyle = {
  cmd = 'checkstyle',
  args = {'-c', 'config/checkstyle/checkstyle.xml'},
  ignore_exitcode = true,
  parser = require('lint.parser').from_errorformat(format, {
    source = 'checkstyle',
  }),
}

require('lint').linters_by_ft = {
  java = {'checkstyle'},
}
