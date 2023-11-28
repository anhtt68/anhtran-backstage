import React from 'react';
import { renderWithEffects } from '@backstage/test-utils';
import App from './App';

describe('App', () => {
  it('should render', async () => {
    process.env = {
      NODE_ENV: 'test',
      APP_CONFIG: [
        {
          data: {
            app: { title: 'Test' },
            backend: { baseUrl: 'http://backstage-alb-1540112729.us-east-1.elb.amazonaws.com:7000' },
            techdocs: {
              storageUrl: 'http://backstage-alb-1540112729.us-east-1.elb.amazonaws.com:7000/api/techdocs/static/docs',
            },
          },
          context: 'test',
        },
      ] as any,
    };

    const rendered = await renderWithEffects(<App />);
    expect(rendered.baseElement).toBeInTheDocument();
  });
});
