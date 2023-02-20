package com.liferay.blade.samples.corejsphook;


import com.liferay.portal.kernel.language.UTF8Control;
import org.osgi.service.component.annotations.Component;

import java.util.Enumeration;
import java.util.ResourceBundle;

@Component(
        property = { "language.id=en_US" },
        service = ResourceBundle.class
)
public class LanguageHook  extends ResourceBundle  {
    ResourceBundle bundle = ResourceBundle.getBundle("content.Language", UTF8Control.INSTANCE);

    @Override
    protected Object handleGetObject(String key) {
        return bundle.getObject(key);
    }

    @Override
    public Enumeration<String> getKeys() {
        return bundle.getKeys();
    }
}
