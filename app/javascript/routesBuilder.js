export const routesBuilder = {
    api: {
        imagePosts: {
            root: '/api/image_posts',
            edit: (image_post_id) => `/api/image_posts/${image_post_id}`
        }
    }
}
