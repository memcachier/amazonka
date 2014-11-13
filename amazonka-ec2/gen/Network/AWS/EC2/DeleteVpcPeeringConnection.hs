{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}
-- {-# OPTIONS_GHC -fno-warn-unused-binds  #-} doesnt work if wall is used
{-# OPTIONS_GHC -w #-}

-- Module      : Network.AWS.EC2.DeleteVpcPeeringConnection
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes a VPC peering connection. Either the owner of the requester VPC or
-- the owner of the peer VPC can delete the VPC peering connection if it's in
-- the active state. The owner of the requester VPC can delete a VPC peering
-- connection in the pending-acceptance state.
module Network.AWS.EC2.DeleteVpcPeeringConnection
    (
    -- * Request
      DeleteVpcPeeringConnection
    -- ** Request constructor
    , deleteVpcPeeringConnection
    -- ** Request lenses
    , dvpcDryRun
    , dvpcVpcPeeringConnectionId

    -- * Response
    , DeleteVpcPeeringConnectionResponse
    -- ** Response constructor
    , deleteVpcPeeringConnectionResponse
    -- ** Response lenses
    , dvpcrReturn
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.EC2.Types
import qualified GHC.Exts

data DeleteVpcPeeringConnection = DeleteVpcPeeringConnection
    { _dvpcDryRun                 :: Maybe Bool
    , _dvpcVpcPeeringConnectionId :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'DeleteVpcPeeringConnection' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dvpcDryRun' @::@ 'Maybe' 'Bool'
--
-- * 'dvpcVpcPeeringConnectionId' @::@ 'Text'
--
deleteVpcPeeringConnection :: Text -- ^ 'dvpcVpcPeeringConnectionId'
                           -> DeleteVpcPeeringConnection
deleteVpcPeeringConnection p1 = DeleteVpcPeeringConnection
    { _dvpcVpcPeeringConnectionId = p1
    , _dvpcDryRun                 = Nothing
    }

dvpcDryRun :: Lens' DeleteVpcPeeringConnection (Maybe Bool)
dvpcDryRun = lens _dvpcDryRun (\s a -> s { _dvpcDryRun = a })

-- | The ID of the VPC peering connection.
dvpcVpcPeeringConnectionId :: Lens' DeleteVpcPeeringConnection Text
dvpcVpcPeeringConnectionId =
    lens _dvpcVpcPeeringConnectionId
        (\s a -> s { _dvpcVpcPeeringConnectionId = a })

instance ToQuery DeleteVpcPeeringConnection

instance ToPath DeleteVpcPeeringConnection where
    toPath = const "/"

newtype DeleteVpcPeeringConnectionResponse = DeleteVpcPeeringConnectionResponse
    { _dvpcrReturn :: Maybe Bool
    } deriving (Eq, Ord, Show, Generic)

-- | 'DeleteVpcPeeringConnectionResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dvpcrReturn' @::@ 'Maybe' 'Bool'
--
deleteVpcPeeringConnectionResponse :: DeleteVpcPeeringConnectionResponse
deleteVpcPeeringConnectionResponse = DeleteVpcPeeringConnectionResponse
    { _dvpcrReturn = Nothing
    }

-- | Returns true if the request succeeds; otherwise, it returns an error.
dvpcrReturn :: Lens' DeleteVpcPeeringConnectionResponse (Maybe Bool)
dvpcrReturn = lens _dvpcrReturn (\s a -> s { _dvpcrReturn = a })

instance AWSRequest DeleteVpcPeeringConnection where
    type Sv DeleteVpcPeeringConnection = EC2
    type Rs DeleteVpcPeeringConnection = DeleteVpcPeeringConnectionResponse

    request  = post "DeleteVpcPeeringConnection"
    response = xmlResponse $ \h x -> DeleteVpcPeeringConnectionResponse
        <$> x %| "return"
