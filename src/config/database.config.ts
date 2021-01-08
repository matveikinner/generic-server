import { registerAs } from '@nestjs/config';
import { ConnectionOptions } from 'typeorm';

export default registerAs(
  'database',
  (): ConnectionOptions => ({
    type: 'postgres',
    name: process.env.DB_CONNECTION_NAME || 'default',
    entities: ['dist/**/*.entity{.ts,.js}'],
    synchronize: true,
    host: process.env.DB_HOST || 'localhost',
    port: <number>(<unknown>process.env.DB_PORT) || 5432,
    username: process.env.DB_USERNAME || 'root',
    password: process.env.DB_PASSWORD || 'password',
    database: process.env.DB_NAME || 'postgres',
  })
);
