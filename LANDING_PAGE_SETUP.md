# Sprites Landing Page - Setup Guide

## Overview
This is a state-of-the-art landing page for Sprites AI Agents with integrated waitlist functionality using Supabase.

## Files
- `index.html` - Main landing page with all features
- `supabase-schema.sql` - Database schema for the waitlist table

## Features
✅ Modern, responsive design with animations
✅ Hero section with brand logo
✅ Features showcase (6 key features)
✅ Screenshot gallery
✅ Waitlist signup form
✅ Supabase integration
✅ Mobile-responsive layout
✅ Smooth scrolling and animations

## Setup Instructions

### 1. Supabase Database Setup

1. Go to your Supabase project: https://ujwtkcivzbofumtsumcx.supabase.co
2. Navigate to the SQL Editor
3. Copy and paste the entire content from `supabase-schema.sql`
4. Run the SQL query
5. Verify that the `waitlist` table was created successfully

### 2. Test the Landing Page

1. Open `index.html` in a web browser
2. Test the waitlist form by entering:
   - Name
   - Email
   - Company (optional)
3. Click "Jetzt auf Warteliste eintragen"
4. You should see a success message

### 3. Verify Database Entries

1. Go back to your Supabase dashboard
2. Navigate to Table Editor → waitlist
3. You should see your test entry

### 4. Deploy (Optional)

You can deploy this landing page to:
- **Netlify**: Drag and drop the entire folder
- **Vercel**: Connect your git repository
- **GitHub Pages**: Push to GitHub and enable Pages
- **Any static hosting**: Upload `index.html` and the folders

## Database Schema

The waitlist table includes:
- `id` (UUID) - Unique identifier
- `name` (TEXT) - User's name
- `email` (TEXT) - User's email (unique)
- `company` (TEXT) - Company name (optional)
- `created_at` (TIMESTAMP) - Signup timestamp
- `updated_at` (TIMESTAMP) - Last update timestamp

## Security Features

- Row Level Security (RLS) enabled
- Public insert policy (anyone can sign up)
- Read access restricted to authenticated users
- Email uniqueness constraint (prevents duplicate signups)

## Customization

### Change Colors
Edit the CSS variables in `index.html`:
```css
:root {
    --primary-blue: #1e3a8a;
    --secondary-blue: #3b82f6;
    --accent-green: #10b981;
    --light-bg: #f8fafc;
    --dark-text: #1e293b;
    --gray-text: #64748b;
}
```

### Add More Screenshots
Add images to the `ScreenshotsFrontend` folder and update the screenshots grid in `index.html`.

### Modify Features
Edit the features-grid section in `index.html` to add, remove, or modify feature cards.

## Troubleshooting

### Form submission fails
- Check browser console for errors
- Verify Supabase URL and API key are correct
- Ensure the waitlist table exists in Supabase
- Check RLS policies are set correctly

### Duplicate email error
- The email field has a UNIQUE constraint
- Users can only sign up once with the same email

## Analytics View

The SQL schema includes a `waitlist_analytics` view that provides:
- Daily signup counts
- Signups with company information
- Sortable by date

Access it in Supabase SQL Editor:
```sql
SELECT * FROM waitlist_analytics;
```

## Next Steps

1. ✅ Test the landing page locally
2. ✅ Set up the Supabase table
3. ⬜ Deploy to production
4. ⬜ Add email notifications (optional)
5. ⬜ Set up analytics tracking (optional)
6. ⬜ Add social media sharing (optional)

## Support

For questions or issues, refer to:
- Supabase Docs: https://supabase.com/docs
- HTML/CSS/JS: Standard web documentation
