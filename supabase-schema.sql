-- Sprites Waitlist Table Schema
-- Run this SQL in your Supabase SQL Editor to create the waitlist table

CREATE TABLE IF NOT EXISTS waitlist (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    company TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index on email for faster lookups
CREATE INDEX IF NOT EXISTS idx_waitlist_email ON waitlist(email);

-- Create index on created_at for sorting
CREATE INDEX IF NOT EXISTS idx_waitlist_created_at ON waitlist(created_at DESC);

-- Enable Row Level Security (RLS)
ALTER TABLE waitlist ENABLE ROW LEVEL SECURITY;

-- Create policy to allow inserts from anyone (for waitlist signup)
CREATE POLICY "Enable insert for all users" ON waitlist
    FOR INSERT
    WITH CHECK (true);

-- Create policy to allow reads for authenticated users only
CREATE POLICY "Enable read access for authenticated users only" ON waitlist
    FOR SELECT
    USING (auth.role() = 'authenticated');

-- Optional: Create a function to update updated_at automatically
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to auto-update updated_at
CREATE TRIGGER update_waitlist_updated_at
    BEFORE UPDATE ON waitlist
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Optional: Create a view for analytics (counts by date)
CREATE OR REPLACE VIEW waitlist_analytics AS
SELECT
    DATE(created_at) as signup_date,
    COUNT(*) as signups_count,
    COUNT(CASE WHEN company IS NOT NULL THEN 1 END) as with_company_count
FROM waitlist
GROUP BY DATE(created_at)
ORDER BY signup_date DESC;
