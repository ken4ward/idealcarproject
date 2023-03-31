<?php

namespace App\Http\Controllers;

use App\Http\Requests\Storefuel_cardsRequest;
use App\Http\Requests\Updatefuel_cardsRequest;
use App\Models\fuel_cards;

class FuelCardsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Storefuel_cardsRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(fuel_cards $fuel_cards)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(fuel_cards $fuel_cards)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updatefuel_cardsRequest $request, fuel_cards $fuel_cards)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(fuel_cards $fuel_cards)
    {
        //
    }
}
