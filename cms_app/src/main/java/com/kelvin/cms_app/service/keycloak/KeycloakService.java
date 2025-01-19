package com.kelvin.cms_app.service.keycloak;

import com.kelvin.cms_app.model.OAuth2IdpToken;
import com.kelvin.cms_app.model.ObjectResponse;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.representations.idm.CredentialRepresentation;

public interface KeycloakService {

    public Boolean isResUserExists(String username);
    public ObjectResponse<String> createMsUser(UserRepresentation userRepresentation);
    public ObjectResponse<String> putPasswordForUser(CredentialRepresentation credentialRepresentation);
    public ObjectResponse<OAuth2IdpToken> getMsUser(String username, String password);
    public ObjectResponse<Void> deleteMsUser(String userRepresentationId);


}