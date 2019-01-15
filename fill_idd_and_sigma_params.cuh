/**
 * \file
 * \brief FillIddAndSigmaParams class declaration
 */
#ifndef FILL_IDD_AND_SIGMA_PARAMS_CUH
#define FILL_IDD_AND_SIGMA_PARAMS_CUH

#include "cuda_member.cuh"

class Float3FromFanTransform;

/**
 * \brief ...
 */
class FillIddAndSigmaParams
{
public:
    /**
     * \brief ...
     * \param beamEnergyIdx ...
     * \param beamEnergyScaleFact ...
     * \param beamPeakDepth ...
     * \param beamEntrySigmaSq ...
     * \param rRlScaleFact ...
     * \param spotDistInRays ...
     * \param nucMemoryStep ...
     * \param firstStep ...
     * \param afterLastStep ...
     * \param fanIdxToImIdx ...
     */
    FillIddAndSigmaParams(const float beamEnergyIdx, const float beamEnergyScaleFact, const float beamPeakDepth, const float beamEntrySigmaSq,
    const float rRlScaleFact, const float spotDistInRays, const unsigned int nucMemoryStep, const unsigned int firstStep, const unsigned int afterLastStep, const Float3FromFanTransform fanIdxToImIdx);

    /**
     * \brief ...
     * \param idxK ...
     * \return float2 ...
     */
    CUDA_CALLABLE_MEMBER float2 voxelWidth(const int idxK) const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getEnergyIdx() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getEnergyScaleFact() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getPeakDepth() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getEntrySigmaSq() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getSpotDist() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER unsigned int getNucMemStep() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getStepLength() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getSigmaSqAirLin() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getSigmaSqAirQuad() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float getRRlScale() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER unsigned int getFirstStep() const;

    /**
     * \brief ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER unsigned int getAfterLastStep() const;

    /**
     * \brief ...
     * \param k ...
     * \return ...
     */
    CUDA_CALLABLE_MEMBER float stepVol(const int k) const;

    /**
     * \brief Sets the values of stepLength and the coeficients for the constant, linear and quadratic part of:
     * sigmaSqAir^2 = sigmaSqAirQuad * k^2 + sigmaSqAirLin * k + sigmaSqAirConst
     * \param idxI ...
     * \param idxJ ...
     * \return void
     */
    CUDA_CALLABLE_MEMBER void initStepAndAirDiv(const int idxI, const int idxJ);

    /**
     * \brief Calculate coefficients of sigma_air^2 = a*z^2 + b*z + spotSize^2 for beam along the central axis
     * \param r0 ...
     * \note if NO_NOZZLE defined, return 0
     * \return float2 ...
     */
    static __host__ __device__ float2 sigmaSqAirCoefs(const float r0);

private:
    float energyIdx;        ///< ...
    float energyScaleFact;  ///< ...
    float peakDepth;        ///< ...
    float stepLength;       ///< ...
    float sigmaSqAirLin;    ///< ...
    float sigmaSqAirQuad;   ///< ...
    float rRlScale;         ///< ...
    unsigned int first;     ///< ...
    unsigned int afterLast; ///< ...
    float3 corner;          ///< ...
    float3 delta;           ///< ...
    float2 dist;            ///< ...
    float volConst;         ///< ...
    float volLin;           ///< ...
    float volSq;            ///< ...
    float entrySigmaSq;     ///< ...
    float spotDist;         ///< ...
    unsigned int nucMemStep;///< ...
};

#endif //FILL_IDD_AND_SIGMA_PARAMS_CUH
