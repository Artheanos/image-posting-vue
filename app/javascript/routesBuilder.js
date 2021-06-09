export const routesBuilder = {
    api: {
        imagePosts: {
            root: '/api/image_posts',
            edit: (image_post_id) => `/api/image_posts/${image_post_id}`
        },
        comments: {
            root: '/api/comments',
            edit: (comment_id) => `/api/comments/${comment_id}`
        },
        users: {
            edit: (user_id) => `/api/users/${user_id}`
        },
        auth: {
            login: {
                root: '/api/auth/login'
            },
            register: {
                root: '/api/auth/register'
            }
        }
    },
    home: '/',
    auth: {
        login: '/login',
        logout: '/logout',
        register: '/register'
    },
    user: (userId) => `/user/${userId}`
}
