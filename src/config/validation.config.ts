import { ValidationPipeOptions } from '@nestjs/common';
import { registerAs } from '@nestjs/config';

export default registerAs(
  'validation',
  (): ValidationPipeOptions => ({
    skipMissingProperties: false,
    whitelist: true,
    forbidNonWhitelisted: false,
    forbidUnknownValues: false,
    disableErrorMessages: false,
    dismissDefaultMessages: false,
  })
);
