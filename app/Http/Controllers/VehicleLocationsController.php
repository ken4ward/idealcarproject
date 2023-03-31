<?php

namespace App\Http\Controllers;

use App\Http\Requests\Storevehicle_locationsRequest;
use App\Http\Requests\Updatevehicle_locationsRequest;
use App\Models\vehicle_locations;

class VehicleLocationsController extends Controller
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
    public function store(Storevehicle_locationsRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(vehicle_locations $vehicle_locations)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(vehicle_locations $vehicle_locations)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updatevehicle_locationsRequest $request, vehicle_locations $vehicle_locations)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(vehicle_locations $vehicle_locations)
    {
        //
    }
}
