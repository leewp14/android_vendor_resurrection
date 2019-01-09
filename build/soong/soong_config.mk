# Insert new variables inside the Lineage structure
lineage_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Lineage": {'; \
	echo '    "Force_screenshot_cpu_path": $(if $(filter true,$(BOARD_FORCE_SCREENSHOT_CPU_PATH)),true,false),'; \
	echo '    "Use_samsung_colorformat": $(if $(filter true,$(BOARD_USE_SAMSUNG_COLORFORMAT)),true,false),'; \
	echo '    "Requires_synchronous_setsurface": $(if $(filter true,$(TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE)),true,false),'; \
	echo '    "Disable_ashmem_tracking": $(if $(filter true,$(TARGET_DISABLE_ASHMEM_TRACKING)),true,false),'; \
	echo '    "Allows_invalid_pthread": $(if $(filter true,$(TARGET_ALLOWS_INVALID_PTHREAD)),true,false),'; \
	echo '    "Egl_needs_handle": $(if $(filter true,$(BOARD_EGL_NEEDS_HANDLE_VALUE)),true,false),'; \
	echo '    "Egl_workaround_bug_10194508": $(if $(filter true,$(BOARD_EGL_WORKAROUND_BUG_10194508)),true,false),'; \
	echo '    "Exynos4_enhancements": $(if $(filter true,$(TARGET_NEEDS_EXYNOS4_ENHANCEMENTS)),true,false),'; \
	echo '    "Has_legacy_camera_hal1": $(if $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)),true,false),'; \
	echo '    "Needs_legacy_camera_hal1_dyn_native_handle": $(if $(filter true,$(TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE)),true,false),'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "Specific_camera_parameter_library": "$(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)",'; \
	echo '    "Target_shim_libs": "$(subst $(space),:,$(TARGET_LD_SHIM_LIBS))",'; \
	echo '    "Uses_generic_camera_parameter_library": $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),false,true),'; \
	echo '    "Uses_nvidia_enhancements": $(if $(filter TRUE,$(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)),true,false),'; \
	echo '    "Uses_qcom_bsp_legacy": $(if $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)),true,false),'; \
	echo '    "Uses_qti_camera_device": $(if $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)),true,false)'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
