import type { Database as DatabaseGenerated } from './supabaseGenerate';
import type { MergeDeep } from 'type-fest';

export type Database = MergeDeep<
  DatabaseGenerated,
  {
    public: {
      Views: {
        // Add you custom types for a given table
      };
    };
  }
>;
