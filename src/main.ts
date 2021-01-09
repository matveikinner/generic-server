import { ValidationPipe, ValidationPipeOptions } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const configService: ConfigService = app.get(ConfigService);
  const validationConfig = configService.get<ValidationPipeOptions>('validation');

  app.useGlobalPipes(new ValidationPipe(validationConfig));
  await app.listen(3000);
}
bootstrap();
