package com.api.booker.runners;

import com.intuit.karate.junit5.Karate;

public class BookerRunner {
        @Karate.Test
        Karate testBookerAPI() {
            return Karate.run("classpath:/com/api/booker/scenarios")
                    .tags("~@Reusable")
                    .relativeTo(getClass());
        }

    }



