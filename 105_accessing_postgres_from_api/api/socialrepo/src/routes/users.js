const express = require('express');
const UserRepo = require('../repos/user-repo');

const router = express.Router();

router.get('/users', async (req, res)=>{
    const users = await UserRepo.find();
    res.send(res.json(users));
});

router.get('/users/:id', async (req, res)=>{});

router.post('/users', async (req, res)=>{});

router.put('/users/:id', async (req, res)=>{});

router.delete('/user/:ids', async (req, res)=>{});

module.exports = router;